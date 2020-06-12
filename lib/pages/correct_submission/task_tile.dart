import 'dart:math';

import 'package:correct/logic/submission.dart';
import 'package:correct/logic/task_note.dart';
import 'package:correct/pages/correct_submission/submission_logic.dart';
import 'package:correct/utils/style.dart';
import 'package:correct/widgets/elevated_input_field.dart';
import 'package:correct/widgets/int_input_field.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:correct/logic/task_submission.dart';

class TaskTile extends StatelessWidget {
  final int taskId;
  final String partName;
  TaskTile({Key key, @required this.taskId, @required this.partName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notifier = SubmissionLogic.of(context);
    return Padding(
      padding: EdgeInsets.all(Style.smallPadding),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(Style.smallPadding),
              child: Text(
                partName ?? "Standard",
                style: Style.title,
              ),
            ),
            ..._buildNotes(context, notifier),
            Center(
              child: RaisedButton(
                child: Text(
                  "ADD NOTE",
                  style: Style.buttonText,
                ),
                onPressed: () {
                  notifier.addNote(taskId, partName);
                },
              ),
            ),
            Divider(),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: notifier
                    .getProposedNotes(taskId)
                    .where((element) => element.part == partName)
                    .map(
                      (e) => NoteProposal(
                        onTap: () => notifier.addPredefinedNote(taskId, e),
                        note: e,
                        maxPoints:
                            notifier.submission.tasks[taskId].maximumPoints,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildNotes(BuildContext context, SubmissionLogic notifier) {
    return notifier.submission.tasks[taskId].notes
        .where((element) => element.part == partName)
        .mapIndexed(
          (e, i) => _Note(
            key: ValueKey(e.uid),
            note: e,
            onChanged: (comment, penalty) =>
                notifier.editNote(taskId, i, comment, penalty, partName),
            onRemoved: () => notifier.removeNote(taskId, i, partName),
          ),
        );
  }
}

class NoteProposal extends StatelessWidget {
  final TaskNote note;
  final int maxPoints;
  final void Function() onTap;
  const NoteProposal(
      {Key key,
      @required this.note,
      @required this.maxPoints,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(Style.smallPadding),
      child: Card(
        color: Color.lerp(
            Colors.green, Colors.red, note.penalty / max(maxPoints, 1)),
        elevation: 0,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(Style.smallPadding),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    Text(
                      note.comment,
                      style: Style.subtitle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Card(
                    elevation: 0,
                    shape: CircleBorder(),
                    child: Padding(
                      padding: EdgeInsets.all(Style.smallPadding),
                      child: Text(
                        note.penalty.toString(),
                        style: Style.subtitle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Note extends StatefulWidget {
  final void Function(String comment, double penalty) onChanged;
  final void Function() onRemoved;
  final TaskNote note;
  const _Note(
      {Key key,
      @required this.onChanged,
      @required this.note,
      @required this.onRemoved})
      : super(key: key);

  @override
  __NoteState createState() => __NoteState();
}

class __NoteState extends State<_Note> {
  TextEditingController _commentController, _penaltyController;
  double penalty;
  String comment;

  @override
  void initState() {
    penalty = widget.note.penalty;
    comment = widget.note.comment;
    _commentController = TextEditingController(text: widget.note.comment);
    _penaltyController =
        TextEditingController(text: widget.note.penalty.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Style.smallPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1618,
            child: ElevatedMultilineInputField(
              controller: _commentController,
              hint: "Insert comment",
              onChanged: onChangedComment,
            ),
          ),
          SizedBox(
            width: Style.smallPadding,
          ),
          Expanded(
            flex: 1000,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Style.mediumPadding),
                  child: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () => onChangedPenalty(penalty - 0.5),
                  ),
                ),
                Text(
                  "-${penalty}pts",
                  style: Style.subtitle,
                ),
                IconButton(
                  icon: Icon(Icons.add_circle),
                  onPressed: () => onChangedPenalty(penalty + 0.5),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Style.mediumPadding),
            child: IconButton(
              icon: Icon(Icons.remove),
              onPressed: widget.onRemoved,
            ),
          )
        ],
      ),
    );
  }

  void onChangedComment(String value) {
    comment = value;
    widget.onChanged(comment, penalty);
  }

  void onChangedPenalty(double value) {
    penalty = max(value, 0);
    widget.onChanged(comment, penalty);
  }
}

extension IterableExt<E> on Iterable<E> {
  List<T> mapIndexed<T>(T Function(E element, int index) mapFnkt) {
    List<T> iterable = [];
    int index = 0;
    for (var item in this) {
      iterable.add(mapFnkt(item, index));
      index++;
    }
    return iterable;
  }
}
