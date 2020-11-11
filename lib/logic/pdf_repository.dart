// import 'dart:convert';
// import 'dart:html';
// import 'dart:math';
// import 'dart:typed_data';

// import 'package:correct/logic/submission.dart';
// import 'package:correct/logic/task_submission.dart';
// import 'package:correct/utils/style.dart';
// import 'package:flutter/material.dart' as md;
// import 'package:http/http.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart';
// import 'package:image/image.dart' as im;
// import 'package:printing/printing.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:archive/archive.dart' as a;

// class PdfRepository {
//   Future<im.Image> renderLaTex(String laTex) async {
//     var response = await get(
//         "https://chart.googleapis.com/chart?cht=tx&chl=$laTex"); //await get("https://chart.googleapis.com/chart?cht=tx&chl=\$x_i = 0\$"); // https://latex.codecogs.com/png.latex?$laTex
//     if (response.statusCode != 200) print("OH NOOO");
//     var img = im.decodePng(response.bodyBytes);
//     return img;
//   }

//   Future<Widget> renderParagraph(
//       List<_Section> sections, Document pdf, TextStyle style) async {
//     var spans =
//         await Future.wait(sections.map((e) => resolveSection(e, pdf, style)));
//     return RichText(
//       text: TextSpan(
//         children: spans,
//       ),
//     );
//   }

//   Future<InlineSpan> resolveSection(
//       _Section section, Document pdf, TextStyle style) async {
//     if (section.isLaTex) {
//       var img = await renderLaTex(section.content);
//       var pdfImg = PdfImage.fromImage(pdf.document, image: img);
//       return WidgetSpan(
//         child: Image(pdfImg),
//         baseline: -3,
//       );
//     } else {
//       return TextSpan(text: section.content, style: style);
//     }
//   }

//   /* Future<Uint8List> exportSubmissions(List<Submission> submissions) async {
//     var pdfs = await Future.wait(submissions.map((e) => createPdf(e)));
//     var zip = zipFiles(pdfs, submissions);
//     return zip;
//   } */

//   void downloadFile(
//     Uint8List bytes,
//     String downloadName,
//   ) {
//     // Encode our file in base64
//     final _base64 = base64Encode(bytes);
//     // Create the link with the file
//     final anchor =
//         AnchorElement(href: 'data:application/octet-stream;base64,$_base64')
//           ..target = 'blank';
//     // add the name
//     if (downloadName != null) {
//       anchor.download = downloadName;
//     }
//     // trigger download
//     document.body.append(anchor);
//     anchor.click();
//     anchor.remove();
//     return;
//   }

//   Uint8List zipFiles(List<String> filenames, List<String> data) {
//     var archive = a.Archive();
//     for (var i = 0; i < filenames.length; i++) {
//       var encodedData = utf8.encode(data[i]);
//       var archiveFile =
//           a.ArchiveFile(filenames[i], encodedData.length, encodedData);
//       archive.addFile(archiveFile);
//     }

//     final tarData = a.TarEncoder().encode(archive);
//     final tarBz2 = a.BZip2Encoder().encode(tarData);
//     return tarBz2;
//   }

//   Future<Uint8List> createPdf(Submission submission) async {
//     var pdf = Document();
//     var fontData = await rootBundle.load("assets/roboto_font.ttf");
//     var font = Font.ttf(fontData);
//     var paragraphTextStyle = TextStyle(
//       fontSize: 14,
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.normal,
//     );
//     var headingTextStyle = TextStyle(
//       font: font,
//       fontSize: 32,
//       fontWeight: FontWeight.bold,
//     );
//     var titleTextStyle = TextStyle(
//       font: font,
//       fontSize: 20,
//       fontWeight: FontWeight.normal,
//     );
//     var list = <Widget>[];
//     list.add(
//       Container(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Expanded(
//               fit: FlexFit.loose,
//               child: Text("${submission.name}", style: headingTextStyle),
//             ),
//             _buildCard(
//               child: Text(
//                   "[${submission.currentPoints}/${submission.maximumPoints}]",
//                   style: headingTextStyle.copyWith(
//                       color: PdfColorExt.fromColor(md.Colors.white))),
//               color: md.Color.lerp(
//                 md.Colors.green,
//                 md.Colors.red,
//                 (submission.maximumPoints - submission.currentPoints) /
//                     max(submission.maximumPoints, 1),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//     list.add(Divider());
//     list.add(Text(
//       "Submission of ${submission.studentContributors.map((e) => e.name).join(",")}",
//       style: titleTextStyle,
//     ));
//     for (var task in submission.tasks) {
//       list.add(SizedBox(height: Style.mediumPadding / 2));
//       list.add(
//         Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text(
//                 "${task.name}",
//                 style: titleTextStyle,
//               ),
//               _buildCard(
//                 child: Text("[${task.currentPoints}/${task.maximumPoints}]",
//                     style: titleTextStyle.copyWith(
//                         color: PdfColorExt.fromColor(md.Colors.white))),
//                 color: md.Color.lerp(
//                   md.Colors.green,
//                   md.Colors.red,
//                   (task.maximumPoints - task.currentPoints) /
//                       max(task.maximumPoints, 1),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//       list.add(Divider());
//       for (var note in task.notes) {
//         var parts = note.comment.split("\$");
//         var sections = <_Section>[];
//         for (var i = 0; i < parts.length; i++) {
//           sections.add(_Section(i % 2 == 1, parts[i]));
//         }
//         var paragraph =
//             await renderParagraph(sections, pdf, paragraphTextStyle);
//         list.add(
//           Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text("In ${note.part}:", style: paragraphTextStyle),
//                 Expanded(child: paragraph),
//                 _buildCard(
//                   child: Text("-${note.penalty}",
//                       style: paragraphTextStyle.copyWith(
//                         color: PdfColorExt.fromColor(md.Colors.white),
//                       )),
//                   color: md.Color.lerp(
//                     md.Colors.green,
//                     md.Colors.red,
//                     note.penalty / max(task.maximumPoints, 1),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }
//     }
//     print("pdf list created");
//     pdf.addPage(
//       Page(
//         margin: EdgeInsets.all(10),
//         pageFormat: PdfPageFormat.a4,
//         build: (context) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: list,
//           );
//         },
//       ),
//     );
//     print("added page");
//     return pdf.save();
//   }

//   Widget _buildCard({Widget child, md.Color color}) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: Style.tinyPadding / 2),
//       child: Container(
//         decoration: BoxDecoration(
//           color: PdfColor.fromInt(color.value),
//         ),
//         padding: EdgeInsets.all(Style.smallPadding / 2),
//         child: child,
//       ),
//     );
//   }
// }

// class _Section {
//   final bool isLaTex;
//   final String content;

//   _Section(this.isLaTex, this.content);
// }

// extension PdfColorExt on PdfColor {
//   static PdfColor fromColor(md.Color color) {
//     return PdfColor.fromInt(color.value);
//   }
// }
