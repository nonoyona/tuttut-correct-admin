import 'dart:typed_data';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:correct/logic/auth_service.dart';
import 'package:correct/utils/router.dart';
import 'package:correct/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:ui' as ui;
import 'package:image/image.dart' as im;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

void main() {
  //CloudFunctions.instance.useFunctionsEmulator(origin: "//localhost:5001"); //ONLY USE THIS WHILE TESTING!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<AuthService>(
      create: (context) => AuthService(),
      child: MaterialApp(
        title: 'Correct | University of Stuttgart',
        theme: Style.getThemeData(),
        onGenerateRoute: MyRouteFactory().getRoute,
        initialRoute: "/",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('KaTeX Flutter Home Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              width: 300,
              height: 200,
              child: Text("Tadaaa"),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            renderWidget();
          },
          tooltip: 'Render again. Only working on mobile platform.',
          label: Text('Render LaTeX'),
          icon: Icon(Icons.crop_rotate),
        ),
      ),
    );
  }

  Future renderWidget() async {
    var response = await get(
        "https://latex.codecogs.com/png.latex?x_i = 0"); //await get("https://chart.googleapis.com/chart?cht=tx&chl=\$x_i = 0\$");
    if (response.statusCode != 200) print("OH NOOO");
    var img = im.decodePng(response.bodyBytes);
    return createPdf(img);
  }
}

Future createPdf(im.Image img) async {
  var pdf = pw.Document();
  var pdfImg = PdfImage.fromImage(pdf.document, image: img);
  pdf.addPage(pw.Page(
    margin: pw.EdgeInsets.all(10),
    pageFormat: PdfPageFormat.a4,
    build: (context) {
      return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              "Rückmeldung zu Blatt 0",
              style: pw.TextStyle(fontSize: 30),
            ),
            pw.Divider(),
            pw.RichText(
              text: pw.TextSpan(children: [
                pw.TextSpan(text: "Ey "),
                pw.WidgetSpan(
                  child: pw.Image(pdfImg), //This is made for testing
                  baseline: -3,
                ),
                pw.TextSpan(
                    text:
                        """ Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.   

Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.   

Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.   

Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.   

Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis.   
""")
              ]),
            ),
          ]);
    },
  ));

  await Printing.layoutPdf(onLayout: (_) => pdf.save());
}
