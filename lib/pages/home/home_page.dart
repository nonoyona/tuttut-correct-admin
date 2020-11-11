// import 'package:correct/logic/services/auth_service.dart';
// import 'package:correct/pages/home/home_logic.dart';
// import 'package:correct/pages/home/widgets/exercise_tile.dart';
// import 'package:correct/utils/style.dart';
// import 'package:correct/widgets/link_button.dart';
// import 'package:correct/widgets/notifier_provider_consumer.dart';
// import 'package:correct/widgets/responsive_constrained_box.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return NotifierProviderConsumer<HomeLogic>(
//         create: (context) => HomeLogic(AuthService.of(context)),
//         builder: (context, snapshot) {
//           _handleLogic(context, snapshot);
//           return Scaffold(
//             appBar: AppBar(
//               toolbarHeight: 100,
//               automaticallyImplyLeading: false,
//               titleSpacing: 30,
//               title: Text(
//                 "TutTut | Correct",
//                 style: Style.title,
//               ),
//               elevation: 0,
//               backgroundColor: Colors.transparent,
//               actions: [
//                 FlatButton(
//                   child: Text(
//                     "LOGOUT",
//                     style: Style.buttonText.copyWith(color: Colors.black),
//                   ),
//                   onPressed: () {
//                     snapshot.logout();
//                   },
//                 ),
//                 LinkButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, "/home/users");
//                   },
//                   label: "STUDENTS",
//                 ),
//               ],
//             ),
//             body: CenteredConstrainedBox(
//               child: ListView(
//                 semanticChildCount: snapshot.exercises.length + 1,
//                 children: [
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: Style.smallPadding),
//                       child: RaisedButton.icon(
//                         onPressed: () =>
//                             Navigator.pushNamed(context, "/home/create"),
//                         textColor: Colors.white,
//                         icon: Icon(Icons.add),
//                         label: Text("ADD"),
//                       ),
//                     ),
//                   ),
//                   ..._buildList(context, snapshot),
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   List<Widget> _buildList(BuildContext context, HomeLogic logic) {
//     List<Widget> list = [];
//     var exercises = logic.exercises.map((e) => ExerciseTile(
//           exercise: e.exercise,
//           exercisePath: e.exercisePath,
//         ));
//     list.addAll(exercises);
//     return list;
//   }

//   void _handleLogic(BuildContext context, HomeLogic snapshot) {
//     if (snapshot.loggedOut) {
//       Future.microtask(() => Navigator.pushNamedAndRemoveUntil(
//           context, "/redirect", (route) => false));
//     }
//   }
// }
