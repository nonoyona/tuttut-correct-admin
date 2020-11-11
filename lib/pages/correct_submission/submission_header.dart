// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// import 'package:correct/pages/correct_submission/submission_logic.dart';
// import 'package:correct/utils/style.dart';
// import 'package:correct/widgets/link_button.dart';

// class SubmissionHeader extends StatefulWidget {
//   final TabController controller;

//   SubmissionHeader({
//     Key key,
//     @required this.controller,
//   }) : super(key: key);

//   @override
//   _SubmissionHeaderState createState() => _SubmissionHeaderState();
// }

// class _SubmissionHeaderState extends State<SubmissionHeader>
//     with SingleTickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     var snapshot = SubmissionLogic.of(context);

//     return SliverAppBar(
//       leading: IconButton(
//         icon: Icon(
//           Icons.arrow_back,
//           color: Colors.black,
//         ),
//         onPressed: () => _onExitWithoutSaving(context),
//       ),
//       expandedHeight: Style.expandedAppBarHeight,
//       backgroundColor: Style.surface,
//       actions: <Widget>[
//         LinkButton(
//           onPressed: () {
//             snapshot.save();
//           },
//           label: "SAVE",
//         ),
//       ],
//       title: Text(
//         snapshot.submission?.name ?? "Loading...",
//         style: Style.title,
//       ),
//       bottom: TabBar(
//         controller: widget.controller,
//         tabs: (snapshot.submission.tasks
//                 .map((e) => "${e.name} [${e.currentPoints}/${e.maximumPoints}]")
//                 .toList()
//                   ..add("Contributors"))
//             .map(
//               (e) => Tab(
//                 child: Text(
//                   e,
//                   style: Style.subtitle,
//                 ),
//               ),
//             )
//             .toList(),
//       ),
//     );
//   }

//   void _onExitWithoutSaving(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Correction not saved!"),
//           content: Text("Do you really want to exit without saving?"),
//           actions: [
//             FlatButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 Navigator.pop(context);
//               },
//               child: Text(
//                 "YES",
//                 style: Style.buttonText.copyWith(color: Style.errorColor),
//               ),
//             ),
//             FlatButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text(
//                 "NO",
//                 style: Style.buttonText.copyWith(color: Style.secondaryColor),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class SubmissionHeaderNotLoaded extends StatelessWidget {
//   const SubmissionHeaderNotLoaded({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       leading: IconButton(
//         icon: Icon(
//           Icons.arrow_back,
//           color: Colors.black,
//         ),
//         onPressed: () => Navigator.pop(context),
//       ),
//       expandedHeight: Style.expandedAppBarHeight,
//       backgroundColor: Style.surface,
//       actions: <Widget>[
//         LinkButton(
//           onPressed: () {},
//           label: "SAVE",
//         ),
//       ],
//       flexibleSpace: FlexibleSpaceBar(
//         title: Text(
//           "Loading...",
//           style: Style.title,
//         ),
//       ),
//     );
//   }
// }
