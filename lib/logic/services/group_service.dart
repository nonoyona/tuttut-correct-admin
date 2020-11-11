import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:correct/logic/dataobjects/group_info.dart';
import 'package:correct/logic/services/auth_service.dart';
import 'package:uuid/uuid.dart';

class GroupService {
  static final instance = GroupService._();
  GroupService._();

  Future<bool> createGroup(String name) async {
    final collection = Firestore.instance.collection("groups");
    final id = Uuid().v4();
    final user = await AuthService.instance.getUser();
    await collection.document(id).setData(GroupInfo(
          name: name,
          id: id,
          userId: user.uid,
        ).toJson());
    return true;
  }

  Stream<List<GroupInfo>> listenToGroupInfos() async* {
    final user = await AuthService.instance.getUser();
    yield* Firestore.instance
        .collection("groups")
        .where("userId", isEqualTo: user.uid)
        .snapshots()
        .map(
          (event) =>
              event.documents.map((e) => GroupInfo.fromJson(e.data)).toList(),
        );
  }
}
