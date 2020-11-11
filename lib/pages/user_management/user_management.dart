// import 'package:correct/logic/services/auth_service.dart';
// import 'package:correct/pages/user_management/user_management_logic.dart';
// import 'package:correct/utils/style.dart';
// import 'package:correct/widgets/elevated_input_field.dart';
// import 'package:correct/widgets/link_button.dart';
// import 'package:correct/widgets/notifier_provider_consumer.dart';
// import 'package:correct/widgets/responsive_constrained_box.dart';
// import 'package:flutter/material.dart';

// class UserManagementPage extends StatelessWidget {
//   const UserManagementPage({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return NotifierProviderConsumer<UserManagementLogic>(
//       create: (context) => UserManagementLogic(auth: AuthService.of(context)),
//       builder: (context, snapshot) {
//         return Scaffold(
//           body: CenteredConstrainedBox(
//             child: CustomScrollView(
//               slivers: <Widget>[
//                 SliverAppBar(
//                   leading: IconButton(
//                     icon: Icon(
//                       Icons.arrow_back,
//                       color: Colors.black,
//                     ),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                   expandedHeight: Style.expandedAppBarHeight,
//                   backgroundColor: Style.surface,
//                   actions: <Widget>[
//                     LinkButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, "/home/users/add");
//                       },
//                       label: "ADD",
//                     ),
//                   ],
//                   flexibleSpace: FlexibleSpaceBar(
//                       title: Text(
//                     "Your students",
//                     style: Style.title,
//                   )),
//                 ),
//                 SliverList(
//                   delegate: SliverChildListDelegate(
//                     _buildList(context, snapshot),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   List<Widget> _buildList(BuildContext context, UserManagementLogic snapshot) {
//     if (!snapshot.loaded) return [];
//     return snapshot.students.map(
//       (e) {
//         var info = snapshot.getStudentInfo(e);
//         return ListTile(
//           title: Text("${e.idString}"),
//           subtitle: Text("Code: ${e.id}"),
//           onTap: () => Navigator.of(context)
//               .pushNamed("/home/users/profile", arguments: {"student": e}),
//           trailing: Container(
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   "${info.reachedPoints} pts",
//                   style: Style.body,
//                 ),
//                 VerticalDivider(),
//                 ConstrainedBox(
//                   constraints: BoxConstraints(minWidth: 100),
//                   child: Text(
//                     "${info.votingPoints}(${info.votingPointsOverHalf}) vpts",
//                     style: Style.body,
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(
//                     Icons.check,
//                     color: e.passed == true ? Colors.green : null,
//                   ),
//                   onPressed: () =>
//                       snapshot.changePassed(e, e.passed != true ? true : null),
//                   tooltip: "Set passed",
//                 ),
//                 IconButton(
//                   icon: Icon(
//                     Icons.close,
//                     color: e.passed == false ? Colors.red : null,
//                   ),
//                   onPressed: () =>
//                       snapshot.changePassed(e, e.passed != false ? false : null),
//                   tooltip: "Set not passed",
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     ).toList();
//   }
// }
