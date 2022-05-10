import 'package:flutter/cupertino.dart';

class EditImageController with ChangeNotifier {
  final String defaultEditingText =
      'Esta imagem ainda não tem nenhuma descrição.';
  List<String> _imageDescriptionText = [];
  List<String> get imageDescriptionText => _imageDescriptionText;

  void setDescriptionsList(List<String> list) {
    _imageDescriptionText = list;
    notifyListeners();
  }

  void setDescriptionText(int index, String text) {
    _imageDescriptionText[index] = text;
    notifyListeners();
  }
}
