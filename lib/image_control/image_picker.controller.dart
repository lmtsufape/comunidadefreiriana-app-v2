import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController with ChangeNotifier {
  Future<File?> pickImageFromGalery() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowedExtensions: ['jpg'], type: FileType.custom);

    if (result != null) {
      File file = File(result.files.single.path!);
      return file;
    } else {
      return null;
    }
  }

  Future<File?> pickImageFromCamera() async {
    XFile? temp = await ImagePicker().pickImage(source: ImageSource.camera);
    if (temp != null) {
      File file = File(temp.path);
      return file;
    } else {
      return null;
    }
  }
}
