import 'dart:io';
import 'package:comunidadefreiriana/core/api.dart';
import 'package:comunidadefreiriana/image_control/image_picker.controller.dart';
import 'package:flutter/cupertino.dart';

class ImageController with ChangeNotifier {
  // ignore: unused_field
  final _api = Api();
  bool isLoading = false;
  bool isUploadingImages = false;
  // ignore: unused_field
  final _imagePickerController = ImagePickerController();

  int _selectedImageLength = 0;
  int? _selectedImageIndex;
  bool _showCommentSection = false;

  List<File> _selectedImages = [];
  // ignore: prefer_final_fields
  List<String> _imagePaths = [];

  List<String> get imagePaths => _imagePaths;

  // ignore: unnecessary_getters_setters
  List<File> get selectedImages => _selectedImages;
  set selectedImages(List<File> value) {
    _selectedImages = value;
  }

  int get selectedImageIndex => _selectedImageIndex!;
  set selectedImageIndex(int value) {
    _selectedImageIndex = value;
  }

  // ignore: unnecessary_getters_setters
  int get selectedImageLength => _selectedImageLength;
  get showCommentSection => _showCommentSection;

  set selectedImageLength(int length) {
    _selectedImageLength = length;
  }

  set setCommentSection(bool value) {
    _showCommentSection = value;
  }

  Future selectImages(BuildContext context) async {
    List<File>? files =
        (await _imagePickerController.pickImagesFromGalery())?.cast<File>();
    selectedImageLength = files!.length;
    selectedImages = files;
  }

  void editImage(int index) {
    selectedImageIndex = index;
  }

  void deleteSelectedImage() {
    selectedImages.removeAt(selectedImageIndex);
    selectedImageLength = selectedImages.length;
  }

  void clearWorkingImages() {
    selectedImages.clear();
    selectedImageLength = 0;
    _imagePaths.clear();
  }
}
