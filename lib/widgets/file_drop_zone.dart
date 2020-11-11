import 'dart:async';
import 'dart:html';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class DropzoneWidget extends StatefulWidget {
  final Widget child;
  final Widget mouseOverChild;
  final void Function(Uint8List fileData, String fileName) onFileDrop;

  DropzoneWidget({
    Key key,
    @required this.child,
    @required this.mouseOverChild,
    @required this.onFileDrop,
  }) : super(key: key);

  @override
  _DropzoneWidgetState createState() => new _DropzoneWidgetState();
}

class _DropzoneWidgetState extends State<DropzoneWidget> {
  StreamSubscription<MouseEvent> _onDragOverSubscription;
  StreamSubscription<MouseEvent> _onDropSubscription;
  StreamSubscription<MouseEvent> _onDragLeaveSubscription;
  final StreamController<_DragState> _dragStateStreamController =
      new StreamController<_DragState>.broadcast();
  final StreamController<Point<double>> _pointStreamController =
      new StreamController<Point<double>>.broadcast();

  void _onDragOver(MouseEvent value) {
    value.stopPropagation();
    value.preventDefault();
    this
        ._pointStreamController
        .sink
        .add(Point<double>(value.layer.x.toDouble(), value.layer.y.toDouble()));
    this._dragStateStreamController.sink.add(_DragState.dragging);
  }

  void _onDrop(MouseEvent value) {
    value.stopPropagation();
    value.preventDefault();
    _pointStreamController.sink.add(null);
    _addFiles(value.dataTransfer.files);
    this._dragStateStreamController.sink.add(_DragState.notDragging);
  }

  void _onDragLeave(MouseEvent value) {
    this._dragStateStreamController.sink.add(_DragState.notDragging);
  }

  void _addFiles(List<File> newFiles) {
    if (newFiles.length >= 1) {
      var file = newFiles[0];
      FileReader reader = FileReader();
      reader.onLoadEnd.listen((e) {
        widget.onFileDrop(reader.result, file.name);
      });

      reader.readAsArrayBuffer(file);
    }
  }

  @override
  void initState() {
    super.initState();
    this._onDragOverSubscription = document.body.onDragOver.listen(_onDragOver);
    this._onDropSubscription = document.body.onDrop.listen(_onDrop);
    this._onDragLeaveSubscription =
        document.body.onDragLeave.listen(_onDragLeave);
    //this._inputElement = FileUploadInputElement();//..style.display = 'none';
    //this._fileSelectionSubscription = this._inputElement.onChange.listen(_fileSelection);
  }

  @override
  void dispose() {
    this._onDropSubscription.cancel();
    this._onDragOverSubscription.cancel();
    this._onDragLeaveSubscription.cancel();
    this._dragStateStreamController.close();
    this._pointStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<_DragState>(
      stream: this._dragStateStreamController.stream,
      builder: (context, snapshot) {
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 200),
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          child: snapshot.data == _DragState.dragging
              ? widget.mouseOverChild
              : widget.child,
        );
      },
    );
  }

  // Widget buildDragOver(BuildContext context) {
  //   return LayoutBuilder(
  //     builder: (BuildContext context, BoxConstraints boxConstraints) => Stack(
  //       children: <Widget>[
  //         Container(
  //           color: Colors.black45,
  //           child: Padding(
  //             padding: const EdgeInsets.all(45),
  //             child: DottedBorder(
  //               color: Colors.white60,
  //               strokeWidth: 5.0,
  //               gap: 24.0,
  //               child: Center(
  //                 child: Text(
  //                   'Datei fallen lassen zum Hochladen',
  //                   maxLines: 1,
  //                   overflow: TextOverflow.ellipsis,
  //                   style: TextStyle(
  //                     fontSize: boxConstraints.maxWidth / 30,
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.white60,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //         StreamBuilder(
  //           initialData: null,
  //           stream: this._pointStreamController.stream,
  //           builder: (BuildContext context,
  //                   AsyncSnapshot<Point<double>> snapPoint) =>
  //               (snapPoint.data == null ||
  //                       snapPoint.data is! Point<double> ||
  //                       snapPoint.data == const Point<double>(0.0, 0.0))
  //                   ? Container()
  //                   : StreamBuilder(
  //                       initialData: null,
  //                       stream: this._dragStateStreamController.stream,
  //                       builder: (BuildContext context,
  //                               AsyncSnapshot<_DragState> snapState) =>
  //                           (snapState.data == null ||
  //                                   snapState.data is! _DragState ||
  //                                   snapState.data == _DragState.notDragging)
  //                               ? Container()
  //                               : Positioned(
  //                                   height: 140,
  //                                   width: 140,
  //                                   left: snapPoint.data.x - 65,
  //                                   top: snapPoint.data.y + 10,
  //                                   child: Icon(
  //                                     Icons.file_upload,
  //                                     size: boxConstraints.maxWidth / 30,
  //                                     color: Colors.white70,
  //                                   ),
  //                                 ),
  //                     ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

enum _DragState {
  dragging,
  notDragging,
}
