import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:correct/logic/dataobjects/exercise_info.dart';
import 'package:correct/logic/services/auth_service.dart';
import 'package:uuid/uuid.dart';

class ExerciseService {
  static final instance = ExerciseService._();
  ExerciseService._();

  Stream<List<ExerciseInfo>> listenToExerciseInfos(String groupId) async*{
    final user = await AuthService.instance.getUser();
    yield* Firestore.instance
        .collection("exercises")
        .where("userId", isEqualTo: user.uid)
        .snapshots()
        .map(
          (event) =>
              event.documents.map((e) => ExerciseInfo.fromJson(e.data)).toList(),
        );
  }

  Future<bool> createExercise(String name, String groupId) async {
    final collection = Firestore.instance.collection("exercises");
    final id = Uuid().v4();
    final user = await AuthService.instance.getUser();
    await collection.document(id).setData(ExerciseInfo(
          id: id,
          name: name,
          userId: user.uid,
          groupId: groupId,
        ).toJson());
    return true;
  }
}
