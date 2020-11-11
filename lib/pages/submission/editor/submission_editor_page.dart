import 'package:correct/pages/submission/submission_logic.dart';
import 'package:correct/utils/style.dart';
import 'package:correct/widgets/elevated_input_field.dart';
import 'package:correct/widgets/elevated_list_tile.dart';
import 'package:correct/widgets/responsive_constrained_box.dart';
import 'package:flutter/material.dart';

class SubmissionEditorPage extends StatefulWidget {
  const SubmissionEditorPage({Key key}) : super(key: key);

  @override
  _SubmissionEditorPageState createState() => _SubmissionEditorPageState();
}

class _SubmissionEditorPageState extends State<SubmissionEditorPage> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(
      text: SubmissionLogic.of(context).state.when(
            loading: () => null,
            loaded: (info, _) => info.correction,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SubmissionLogic.of(context).state.when(
          loading: () => null,
          loaded: (info, override) =>
              override ? controller.text = info.correction : null,
        );
    return CenteredConstrainedBox(
      child: Padding(
        padding: const EdgeInsets.all(Style.smallPadding),
        child: Column(
          children: [
            ElevatedMultilineInputField(
              controller: controller,
              minLines: 10,
              maxLines: 20,
              onChanged: (value) =>
                  SubmissionLogic.of(context).correctionChanged(value),
              onSubmit: (value) => SubmissionLogic.of(context).save(),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                onPressed: () => SubmissionLogic.of(context).save(),
                textColor: Colors.white,
                child: Text("SAVE"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
