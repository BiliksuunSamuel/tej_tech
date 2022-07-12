import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:tej_tech/api/post_routes.dart';
import 'package:tej_tech/controller/index.dart';

class ProductController extends GetxController {
  final Controller controller = Controller();
  void handleImageUpload(String file, String fileName) async {
    var data = {"image": file};
    Response response =
        await controller.handlePost(PostRoutes.productUpload, data);
    print(response.statusText);
    update();
  }

  void handleTest() async {
    var data = {"image": "hello"};
    Response response =
        await controller.handlePost(PostRoutes.productUpload, data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      update();
    } else {
      print(response.statusText);
      update();
    }
  }
}
