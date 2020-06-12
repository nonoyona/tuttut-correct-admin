import 'package:correct/logic/student.dart';
import 'package:correct/pages/correct_submission/submission_logic.dart';
import 'package:correct/pages/correct_submission/task_tile.dart';
import 'package:correct/utils/style.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ContributorsTile extends StatelessWidget {
  final SearchBarController<Student> _controller = SearchBarController();
  ContributorsTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var logic = SubmissionLogic.of(context);
    return Padding(
      padding: EdgeInsets.all(Style.smallPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(Style.smallPadding),
            child: Text(
              "Contributors",
              style: Style.title,
            ),
          ),
          ..._buildContributors(context),
          Expanded(
            child: SearchBar<Student>(
              searchBarController: _controller,
              suggestions: _getSuggestions(logic),
              hintText: "Add a contributor",
              minimumChars: 1,
              shrinkWrap: true,
              emptyWidget: ListTile(
                title: Text("No Contributor found..."),
              ),
              cancellationWidget: Icon(Icons.cancel),
              searchBarStyle: SearchBarStyle(
                backgroundColor: Colors.transparent,
              ),
              onSearch: (txt) => _onSearch(txt, logic),
              onItemFound: (a, b) => _onItemFound(a, b, logic),
            ),
          ),
        ],
      ),
    );
  }

  List<Student> _getSuggestions(SubmissionLogic logic) {
    var list = <Student>[];
    list.addAll(logic.students);
    list.removeWhere(
      (element) => logic.submission.contributors.any(
        (c) {
          return c == "${element.name} (${element.groupName})";
        },
      ),
    );
    return list;
  }

  Future<List<Student>> _onSearch(String text, SubmissionLogic logic) async {
    var textParts = text.split(RegExp(r"[,;._$!=/]"));
    var group = textParts.length > 1 ? textParts[1] : "No Group";
    var name = textParts[0].trim();
    List<Student> list = [];
    list.addAll(logic.students.where((element) =>
        element.name.toLowerCase().contains(name.toLowerCase()) ||
        element.groupName.toLowerCase().contains(group.toLowerCase()) ||
        text.toLowerCase().contains(element.name.toLowerCase()) ||
        text.toLowerCase().contains(element.groupName.toLowerCase())));
    list.removeWhere((element) => logic.submission.contributors.any((c) {
          return c == "${element.name} (${element.groupName})";
        }));
    return list;
  }

  Widget _onItemFound(Student item, int index, SubmissionLogic logic) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text("(${item.groupName})"),
      onTap: () {
        _controller.clear();
        logic.addContributor(item);
      },
    );
  }

  List<Widget> _buildContributors(BuildContext context) {
    var logic = SubmissionLogic.of(context);
    if (logic.submission.contributors.isEmpty) return [];
    List<Widget> list = IterableExt(logic.submission.contributors).mapIndexed(
      (e, i) => ListTile(
        title: Text(e),
        trailing: IconButton(
            icon: Icon(Icons.remove),
            onPressed: () => logic.removeContributor(i)),
      ),
    );
    list.add(Divider());
    return list;
  }

  Future _onAdd(BuildContext context) async {
    var logic = SubmissionLogic.of(context, listen: false);
    var contributors = logic.submission.contributors;
    Navigator.pushNamed(
      context,
      "/home/exercise/submission/contributor",
      arguments: {"contributors": contributors},
    ).then(
      (value) {
        if (value == null) return;
        logic.addContributor(value);
      },
    );
  }
}
