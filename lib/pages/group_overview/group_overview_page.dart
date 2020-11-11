import 'package:correct/logic/dataobjects/group_info.dart';
import 'package:correct/pages/group_overview/group_overview_logic.dart';
import 'package:correct/pages/group_overview/group_overview_state.dart';
import 'package:correct/utils/utils.dart';
import 'package:correct/widgets/elevated_list_tile.dart';
import 'package:correct/widgets/responsive_constrained_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupOverviewPage extends StatelessWidget {
  const GroupOverviewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GroupOverviewLogic>(
      create: (context) => GroupOverviewLogic(),
      child: BlocBuilder<GroupOverviewLogic, GroupOverviewState>(
          builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            automaticallyImplyLeading: false,
            titleSpacing: 30,
            title: Text(
              "TutTut | Correct",
              style: Style.title,
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              FlatButton(
                child: Text(
                  "LOGOUT",
                  style: Style.buttonText.copyWith(color: Colors.black),
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: state.when(
            loading: () => LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Style.primaryColor),
              backgroundColor: Style.primaryColor.withOpacity(0.5),
            ),
            loaded: (groups) => buildLoaded(context, groups),
          ),
        );
      }),
    );
  }

  Widget buildLoaded(BuildContext context, List<GroupInfo> groups) {
    return CenteredConstrainedBox(
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Style.smallPadding),
              child: RaisedButton.icon(
                onPressed: () => Navigator.pushNamed(context, "/create/group"),
                textColor: Colors.white,
                icon: Icon(Icons.add),
                label: Text("ADD"),
              ),
            ),
          ),
          ...groups
              .map((e) => ElevatedListTile(
                    title: e.name,
                    leading: Icon(Icons.group),
                    onPressed: () =>
                        Navigator.pushNamed(context, "/group/${e.id}"),
                  ))
              .toList()
        ],
      ),
    );
  }
}
