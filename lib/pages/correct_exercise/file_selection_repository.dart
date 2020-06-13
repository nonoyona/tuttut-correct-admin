import 'dart:async';
import 'dart:html';

import 'package:flutter/foundation.dart';

class FileSelectionRepository {

  Future<SelectionSucceded> selectFile() async {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.click();
    Completer<SelectionSucceded> c = Completer();

    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      _onFilesSelected(files, c);
    });
    return c.future;
  }

  void _onFilesSelected(List<File> files, Completer completer) {
    List<String> filenames = [];
    List<String> data = [];
    files.forEach((element) {
      FileReader reader = FileReader();
      reader.onLoadEnd.listen((e) {
        data.add(reader.result);
        filenames.add(element.name);
        if (filenames.length == files.length) {
          completer
              .complete(SelectionSucceded(data: data, filenames: filenames));
        }
      });

      reader.onError.listen((fileEvent) {
        completer.completeError("No file selected");
      });

      reader.readAsText(files[0]);
    });
  }
}

class SelectionSucceded {
  final List<String> data;
  final List<String> filenames;
  SelectionSucceded({
    @required this.data,
    @required this.filenames,
  });
}
