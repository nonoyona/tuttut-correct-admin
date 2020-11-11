import 'package:correct/logic/dataobjects/submission_info.dart';
import 'package:correct/logic/services/correction_parser.dart';
import 'package:correct/pages/submission/submission_logic.dart';
import 'package:correct/utils/style.dart';
import 'package:correct/widgets/elevated_list_tile.dart';
import 'package:correct/widgets/responsive_constrained_box.dart';
import 'package:flutter/material.dart';

class SubmissionOverviewPage extends StatelessWidget {
  final SubmissionInfo info;
  const SubmissionOverviewPage({
    Key key,
    @required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CenteredConstrainedBox(
      child: ListView(
        children: [
          ElevatedListTile(
            title: "Passed [${info.points.asString}]",
            trailing: Switch(
              activeColor: Style.successColor,
              value: info.passed,
              onChanged: (value) =>
                  SubmissionLogic.of(context).setPassed(value),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: Style.mediumPadding,
                top: Style.hugePadding,
                bottom: Style.smallPadding),
            child: Text(
              "PARTICIPANTS",
              style: Style.overline,
            ),
          ),
          ...info.participants.map(
            (e) => ElevatedListTile(
              title: e.name,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: Style.mediumPadding,
                top: Style.hugePadding,
                bottom: Style.smallPadding),
            child: Text(
              "TASKS",
              style: Style.overline,
            ),
          ),
          ...CorrectionParser(correction: info.correction).getTaskInfos().map(
                (e) => ElevatedListTile(
                  title: e.name,
                  trailing: Text(
                    e.points.asString,
                    style: Style.subtitle,
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
