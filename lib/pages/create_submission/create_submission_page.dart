import 'package:correct/pages/create_submission/create_submission_logic.dart';
import 'package:correct/pages/create_submission/create_submission_state.dart';
import 'package:correct/utils/utils.dart';
import 'package:correct/widgets/elevated_input_field.dart';
import 'package:correct/widgets/elevated_list_tile.dart';
import 'package:correct/widgets/responsive_constrained_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateSubmissionPage extends StatelessWidget {
  final String groupId;
  final String exerciseId;
  const CreateSubmissionPage({
    Key key,
    @required this.groupId,
    @required this.exerciseId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateSubmissionLogic>(
      create: (context) => CreateSubmissionLogic(
        groupId: groupId,
        exerciseId: exerciseId,
      ),
      child: BlocConsumer<CreateSubmissionLogic, CreateSubmissionState>(
        listener: (context, state) => state.maybeWhen(
          orElse: () => null,
          success: (participants, students, submission) =>
              Navigator.pushReplacementNamed(context,
                  "/group/$groupId/exercise/$exerciseId/submission/${submission.id}"),
        ),
        builder: (context, state) {
          final logic = CreateSubmissionLogic.of(context);
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 100,
              automaticallyImplyLeading: false,
              titleSpacing: 30,
              title: Text(
                "TutTut | Add Submission",
                style: Style.title,
              ),
              actions: [
                FlatButton(
                  child: state.maybeWhen(
                    orElse: () => Text(
                      "CREATE",
                      style: Style.buttonText.copyWith(color: Colors.black),
                    ),
                    submitting: (participants, students) =>
                        CircularProgressIndicator(),
                  ),
                  onPressed: state.maybeMap(
                    orElse: () => () {
                      logic.create();
                    },
                    submitting: (value) => null,
                  ),
                ),
              ],
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: CenteredConstrainedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state.participants.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Style.mediumPadding,
                        vertical: Style.tinyPadding,
                      ),
                      child: Text(
                        "PARTICIPANTS",
                        style: Style.overline,
                      ),
                    ),
                  ...state.participants.map(
                    (e) => ElevatedListTile(
                      title: e.name,
                      trailing: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () =>
                            CreateSubmissionLogic.of(context).removeStudent(e),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Style.mediumPadding,
                      vertical: Style.tinyPadding,
                    ),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(Style.mediumPadding),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ElevatedInputField(
                              labelText: "Search",
                              controller: logic.searchController,
                              onChanged: (value) => logic.changeSearchString(),
                              onSubmit: (value) => logic.addIfUnique(),
                            ),
                            SizedBox(
                              height: Style.smallPadding,
                            ),
                            RaisedButton(
                              textColor: Colors.white,
                              child: Text("SUBMIT"),
                              onPressed: () => logic.addIfUnique(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Style.mediumPadding,
                  ),
                  Expanded(
                    child: state.maybeMap(
                      orElse: () => _buildLoaded(state),
                      loading: (value) => _buildLoading(state),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoaded(CreateSubmissionState state) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: state.students.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(state.students[index].name),
          onTap: () => CreateSubmissionLogic.of(context)
              .addStudent(state.students[index]),
        ),
      ),
    );
  }

  Widget _buildLoading(CreateSubmissionState state) {
    return Container(
      alignment: Alignment.topCenter,
      child: LinearProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Style.primaryColor),
        backgroundColor: Style.primaryColor.withOpacity(0.5),
      ),
    );
  }
}
