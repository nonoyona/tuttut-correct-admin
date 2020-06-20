import 'package:correct/logic/auth_service.dart';
import 'package:correct/pages/home/home_logic.dart';
import 'package:correct/pages/home/widgets/create_exercise_tile.dart';
import 'package:correct/pages/home/widgets/exercise_tile.dart';
import 'package:correct/utils/style.dart';
import 'package:correct/widgets/link_button.dart';
import 'package:correct/widgets/notifier_provider_consumer.dart';
import 'package:correct/widgets/responsive_constrained_box.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotifierProviderConsumer<HomeLogic>(
        create: (context) => HomeLogic(AuthService.of(context)),
        builder: (context, snapshot) {
          _handleLogic(context, snapshot);
          return Scaffold(
            body: CenteredConstrainedBox(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    pinned: true,
                    leading: Container(),
                    expandedHeight: Style.expandedAppBarHeight,
                    backgroundColor: Style.surface,
                    actions: [
                      LinkButton(
                        onPressed: () {
                          snapshot.logout();
                        },
                        label: "LOGOUT",
                      ),
                      LinkButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/home/users");
                        },
                        label: "STUDENTS",
                      ),
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      title: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Hello ${snapshot.name}",
                              style: Style.title,
                            ),
                          ],
                        ),
                      ),
                      titlePadding:
                          EdgeInsets.symmetric(horizontal: Style.mediumPadding),
                    ),
                  ),
                  SliverFillRemaining(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      runSpacing: Style.smallPadding,
                      spacing: Style.smallPadding,
                      children: _buildList(context, snapshot),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  List<Widget> _buildList(BuildContext context, HomeLogic logic) {
    List<Widget> list = [CreateExerciseTile()];
    var exercises = logic.exercises.map((e) => ExerciseTile(
          exercise: e.exercise,
          exercisePath: e.exercisePath,
        ));
    list.addAll(exercises);
    return list;
  }

  void _handleLogic(BuildContext context, HomeLogic snapshot) {
    if (snapshot.loggedOut) {
      Future.microtask(() => Navigator.pushNamedAndRemoveUntil(
          context, "/redirect", (route) => false));
    }
  }
}
