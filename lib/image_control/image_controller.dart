import 'dart:io';
import 'package:comunidadefreiriana/core/api.dart';
import 'package:comunidadefreiriana/image_control/image_picker.controller.dart';
import 'package:flutter/cupertino.dart';

class ImageController with ChangeNotifier {
  // ignore: unused_field
  bool isLoading = false;
  bool isUploadingImages = false;
  // ignore: unused_field
  final _imagePickerController = ImagePickerController();

  int _selectedImageLength = 0;
  int? _selectedImageIndex;
  //bool _showCommentSection = false;

  File? _selectedImage;
  // ignore: prefer_final_fields
  String? _imagePath;

  String? get imagePath => _imagePath;

  // ignore: unnecessary_getters_setters
  File? get selectedImage => _selectedImage;
  set selectedImage(File? value) {
    _selectedImage = value;
  }

  int get selectedImageIndex => _selectedImageIndex!;
  set selectedImageIndex(int value) {
    _selectedImageIndex = value;
  }

  // ignore: unnecessary_getters_setters
  int get selectedImageLength => _selectedImageLength;
  // get showCommentSection => _showCommentSection;

  set selectedImageLength(int length) {
    _selectedImageLength = length;
  }

  Future selectImage(BuildContext context) async {
    File? file = (await _imagePickerController.pickImageFromGalery());
    //selectedImageLength = files!.length;
    selectedImage = file;
  }

  void editImage(int index) {
    selectedImageIndex = index;
  }

  void deleteSelectedImage() {
    selectedImage!.delete();
  }
/*
  void clearWorkingImages() {
    selectedImage!.clear();
    selectedImageLength = 0;
    _imagePath.clear();
  }
  */
}
