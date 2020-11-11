import 'package:correct/hooks/tab_controller_hook.dart';
import 'package:correct/pages/group/exercises/exercises_page.dart';
import 'package:correct/pages/group/students/students_page.dart';
import 'package:correct/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GroupPage extends HookWidget {
  final String groupId;
  const GroupPage({
    Key key,
    @required this.groupId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(2);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        titleSpacing: 30,
        title: Text(
          "TutTut | SKP Gruppe 1",
          style: Style.title,
        ),
        elevation: 0,
        actions: [
          Container(
            width: 400,
            child: TabBar(
              controller: tabController,
              labelColor: Colors.black,
              indicatorColor: Style.primaryColor,
              tabs: [
                Container(
                  height: 100,
                  child: Center(child: Text("EXERCISES")),
                ),
                Container(
                  height: 100,
                  child: Center(child: Text("STUDENTS")),
                ),
              ],
            ),
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          ExercisesPage(
            groupId: groupId,
          ),
          StudentsPage(
            groupId: groupId,
          ),
        ],
      ),
    );
  }
}
