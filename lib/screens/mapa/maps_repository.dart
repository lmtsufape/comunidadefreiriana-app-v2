import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class MapsRepository extends ChangeNotifier {
  final _dio = Dio();
  static const String baseUrl = 'http://185.28.23.76:8010/api';

  Future getInstitution() async {
    try {
      var response = await _dio.get(baseUrl + '/instituicao/aprovados');

      if (response.statusCode == 200) {
        Map<String, dynamic> map = response.data;
        List<dynamic> data = map["data"];
        return data;
      } else {
        if (kDebugMode) {
          print('primeiro null');
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('é bronca pai');
      }
    }
  }

  Future getImageInstitution(id) async {
    // ignore: unnecessary_brace_in_string_interps
    try {
      var image = await _dio.get(baseUrl + '/instituicao/show/$id');

      if (image.statusCode == 200) {
        Map<String, dynamic> map = image.data;
        List<dynamic> data = map["data"]["images"];
        return data[0];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
