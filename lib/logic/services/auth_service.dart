import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  static final instance = AuthService._();

  AuthService._();

  Future<FirebaseUser> handleSignIn() async {
    print("signing in");
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    print("signed in");
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user?.displayName);
    return user;
  }

  Future<bool> isSignedIn() async {
    return (await getUser()) != null;
  }

  Future<FirebaseUser> getUser() async {
    var user = await _auth.currentUser();
    if (user != null) return user;
    final googleUser = await _googleSignIn.signInSilently(suppressErrors: true);
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      user = (await _auth.signInWithCredential(credential)).user;
    }
    return user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

}
