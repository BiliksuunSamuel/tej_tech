import 'package:get/get.dart';

class Controller extends GetConnect implements GetxService {
  late Map<String, dynamic> mainHeaders;
  Controller() {
    baseUrl = "http://192.168.43.230:5000/api/";
    timeout = const Duration(minutes: 1);
    // mainHeaders = {"contentType": "application/json; charset=utf-8"};
  }

  Future<Response> handlePost(String url, dynamic data) async {
    try {
      return await post(url, data);
    } catch (error) {
      return Response(statusCode: 404, statusText: error.toString());
    }
  }

  Future<Response> handleGet(String url) async {
    try {
      return await get(url);
    } catch (error) {
      return Response(statusCode: 404, statusText: error.toString());
    }
  }
}
