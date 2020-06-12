import 'package:correct/hooks/tab_controller_hook.dart';
import 'package:correct/logic/auth_service.dart';
import 'package:correct/logic/exercise.dart';
import 'package:correct/logic/submission.dart';
import 'package:correct/pages/correct_submission/task_tile.dart';
import 'package:correct/pages/select_voters/select_voters_logic.dart';
import 'package:correct/pages/select_voters/select_voters_tab.dart';
import 'package:correct/utils/style.dart';
import 'package:correct/widgets/link_button.dart';
import 'package:correct/widgets/notifier_provider_consumer.dart';
import 'package:correct/widgets/redirect_on_null.dart';
import 'package:correct/widgets/responsive_constrained_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SelectVotersPage extends HookWidget {
  final Exercise exercise;
  final List<Submission> submissions;
  const SelectVotersPage(
      {@required this.exercise, @required this.submissions, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TabController controller = useTabController(this.exercise.tasks.length);
    return RedirectOnNull(
      objects: [this.exercise, this.submissions],
      child: NotifierProviderConsumer<SelectVotersLogic>(
        create: (context) =>
            SelectVotersLogic(AuthService.of(context), submissions, exercise),
        builder: (context, notifier) {
          if (notifier.loaded) {
            return Scaffold(
              body: CenteredConstrainedBox(
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) =>
                      [_buildHeader(context, notifier, controller)],
                  body: TabBarView(
                    controller: controller,
                    children: notifier.exercise.tasks.mapIndexed(
                        (element, index) => SelectVotersTab(taskId: index)),
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildHeader(
      BuildContext context, SelectVotersLogic logic, TabController controller) {
    return SliverAppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      expandedHeight: Style.expandedAppBarHeight,
      backgroundColor: Style.surface,
      title: Text(
        logic.exercise.name,
        style: Style.title,
      ),
      bottom: TabBar(
        controller: controller,
        tabs: (logic.exercise.tasks.map((e) => "${e.name}").toList())
            .map(
              (e) => Tab(
                child: Text(
                  e,
                  style: Style.subtitle,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
