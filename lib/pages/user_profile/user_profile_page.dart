// import 'package:correct/logic/services/auth_service.dart';
// import 'package:correct/logic/student.dart';
// import 'package:correct/pages/user_profile/user_profile_logic.dart';
// import 'package:correct/utils/style.dart';
// import 'package:correct/widgets/notifier_provider_consumer.dart';
// import 'package:correct/widgets/redirect_on_null.dart';
// import 'package:correct/widgets/responsive_constrained_box.dart';
// import 'package:flutter/material.dart';

// class UserProfilePage extends StatelessWidget {
//   const UserProfilePage({Key key, @required this.student}) : super(key: key);

//   final Student student;

//   @override
//   Widget build(BuildContext context) {
//     return RedirectOnNull(
//       objects: [this.student],
//       child: NotifierProviderConsumer<UserProfileLogic>(
//           create: (context) =>
//               UserProfileLogic(student, AuthService.of(context)),
//           builder: (context, logic) {
//             return Scaffold(
//               body: CenteredConstrainedBox(
//                 child: CustomScrollView(
//                   slivers: <Widget>[
//                     SliverAppBar(
//                       leading: IconButton(
//                         icon: Icon(
//                           Icons.arrow_back,
//                           color: Colors.black,
//                         ),
//                         onPressed: () => Navigator.pop(context),
//                       ),
//                       expandedHeight: Style.expandedAppBarHeight,
//                       backgroundColor: Style.surface,
//                       flexibleSpace: FlexibleSpaceBar(
//                           title: Text(
//                         student.idString,
//                         style: Style.title,
//                       )),
//                     ),
//                     SliverList(
//                       delegate: SliverChildListDelegate(
//                         [
//                           logic.loaded
//                               ? _buildLoaded(context, logic)
//                               : _buildLoading(context)
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }),
//     );
//   }

//   Widget _buildLoading(BuildContext context) {
//     return Container(child: Center(child: CircularProgressIndicator()));
//   }

//   Widget _buildLoaded(BuildContext context, UserProfileLogic logic) {
//     return Table(
//       defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//       children: [
//         TableRow(children: [
//           Text(
//             "Exercise",
//             style: Style.subtitle,
//           ),
//           Text(
//             "Points",
//             style: Style.subtitle,
//           ),
//           Text(
//             "Voting Points",
//             style: Style.subtitle,
//           ),
//           Text(
//             "Actions",
//             style: Style.subtitle,
//           ),
//         ]),
//         ...logic.submissions.map(
//           (e) => TableRow(
//             children: [
//               Text(
//                 e.submission.name,
//                 style: Style.subtitle,
//               ),
//               Text(
//                 "${e.submission.currentPoints}/${e.submission.maximumPoints}",
//                 style: Style.subtitle,
//               ),
//               Text(
//                 "${e.submission.getVotingPoints(student.idString)}(${e.submission.getVotingPointsOverHalf(student.idString)})/${e.submission.taskCount}",
//                 style: Style.subtitle,
//               ),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 child: IconButton(
//                   icon: Icon(Icons.open_in_browser),
//                   onPressed: () => Navigator.pushNamed(
//                       context, "/home/exercise/submission",
//                       arguments: {
//                         "submission": e.snapshot,
//                         "exercisePath": e.exercisePath,
//                       }),
//                 ),
//               )
//             ],
//           ),
//         ),
//         TableRow(
//           children: [
//             Text(
//               "Sum",
//               style: Style.subtitle,
//             ),
//             Text(
//               "${logic.allPoints}/${logic.allMaxPoints}",
//               style: Style.subtitle,
//             ),
//             Text(
//               "${logic.allVotingPoints}(${logic.allVotingPointsOverHalf})/${logic.totalTaskCount}",
//               style: Style.subtitle,
//             ),
//             Container()
//           ],
//         )
//       ],
//     );
//   }
// }
