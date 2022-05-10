import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ImagePickerController with ChangeNotifier {
  Future<List<File>?> pickImagesFromGalery() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true, allowedExtensions: ['jpg'], type: FileType.custom);

    if (result != null) {
      List<File> files = result.files.map((file) => File(file.path!)).toList();
      return files;
    } else {
      return null;
    }
  }
}
