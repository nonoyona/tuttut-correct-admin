import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:correct/logic/dataobjects/student_info.dart';
import 'package:correct/logic/services/auth_service.dart';

class StudentService {
  static final instance = StudentService._();
  StudentService._();

  StudentInfo tryFindStudent(String partialName, List<StudentInfo> students) {
    final matches = students
        .where((element) =>
            element.name.toLowerCase().contains(partialName.toLowerCase()))
        .toList();
    if (matches.length == 1) {
      return matches.first;
    } else {
      return null;
    }
  }

  Stream<List<StudentInfo>> listenToStudentInfos(String groupId) async* {
    final user = await AuthService.instance.getUser();
    yield* Firestore.instance
        .collection("students")
        .where("userId", isEqualTo: user.uid)
        .where("groupId", isEqualTo: groupId)
        .snapshots()
        .map(
          (event) =>
              event.documents.map((e) => StudentInfo.fromJson(e.data)).toList(),
        );
  }

  Future<List<StudentInfo>> fetchStudents(String groupId) async {
    final user = await AuthService.instance.getUser();
    final query = await Firestore.instance
        .collection("students")
        .where("userId", isEqualTo: user.uid)
        .where("groupId", isEqualTo: groupId)
        .getDocuments();
    return query.documents.map((e) => StudentInfo.fromJson(e.data)).toList();
  }

  Future<bool> createStudent(String name, String id, String groupId) async {
    final collection = Firestore.instance.collection("students");
    final user = await AuthService.instance.getUser();
    final reference = await collection.document(id).get();
    if (reference.exists) return false;
    await collection.document(id).setData(StudentInfo(
          name: name,
          id: id,
          userId: user.uid,
          groupId: groupId,
        ).toJson());
    return true;
  }
}
