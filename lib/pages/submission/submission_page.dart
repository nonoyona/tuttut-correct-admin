import 'dart:convert';

import 'package:correct/hooks/tab_controller_hook.dart';
import 'package:correct/pages/group/exercises/exercises_page.dart';
import 'package:correct/pages/group/students/students_page.dart';
import 'package:correct/pages/submission/editor/submission_editor_page.dart';
import 'package:correct/pages/submission/overview/submission_overview_page.dart';
import 'package:correct/pages/submission/submission_logic.dart';
import 'package:correct/pages/submission/submission_state.dart';
import 'package:correct/utils/style.dart';
import 'package:correct/widgets/file_drop_zone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SubmissionPage extends HookWidget {
  final String groupId;
  final String submissionId;
  const SubmissionPage({
    Key key,
    @required this.groupId,
    @required this.submissionId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(2);
    return BlocProvider<SubmissionLogic>(
      create: (context) => SubmissionLogic(submissionId),
      child: BlocBuilder<SubmissionLogic, SubmissionState>(
          builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            automaticallyImplyLeading: false,
            titleSpacing: 30,
            title: Text(
              "TutTut | Übungsblatt 1",
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
                      child: Center(child: Text("OVERVIEW")),
                    ),
                    Container(
                      height: 100,
                      child: Center(child: Text("EDITOR")),
                    ),
                  ],
                ),
              )
            ],
            backgroundColor: Colors.transparent,
          ),
          body: state.when(
            loading: () => Container(
              alignment: Alignment.topCenter,
              child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Style.primaryColor),
                backgroundColor: Style.primaryColor.withOpacity(0.5),
              ),
            ),
            loaded: (info, _) => DropzoneWidget(
              child: TabBarView(
                controller: tabController,
                children: [
                  SubmissionOverviewPage(info: info),
                  SubmissionEditorPage(),
                ],
              ),
              mouseOverChild: Padding(
                padding: const EdgeInsets.all(Style.bigPadding),
                child: Card(
                  child: Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Center(
                        child: Text(
                      "Drop File",
                      style: Style.title,
                    )),
                  ),
                ),
              ),
              onFileDrop: (fileData, fileName) {
                try {
                  final content = utf8.decoder.convert(fileData);
                  SubmissionLogic.of(context).correctionChanged(content, true);
                } on FormatException catch (e) {
                  print(e.message);
                }
              },
            ),
          ),
        );
      }),
    );
  }
}
