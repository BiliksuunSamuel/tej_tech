import 'package:get/get.dart';
import 'package:tej_tech/api/get_routes.dart';
import 'package:tej_tech/api/post_routes.dart';
import 'package:tej_tech/app/model/category_model.dart';
import 'package:tej_tech/controller/index.dart';

class CategoryController extends GetxController {
  Controller controller = Controller();
  List<CategoryModel> categories = [];
  String error = "";
  String message = "";
  bool loading = false;

  void handleGetCategories() async {
    try {
      Response response = await controller.handleGet(GetRoutes.categoriesGet);
      if (response.statusCode == 200 || response.statusCode == 201) {
        categories.clear();
        for (dynamic info in response.body) {
          categories.add(CategoryModel.fromJson(info));
        }
        update();
      } else {
        error = response.body;
        print(error);
        update();
      }
    } catch (err) {
      error = err.toString();
      message = "";
      loading = false;
      print(error);
      update();
    }
  }

  void handleAddCategory(dynamic info) async {
    try {
      Response response =
          await controller.handlePost(PostRoutes.categoryAdd, info);
      if (response.statusCode == 200 || response.statusCode == 201) {
        message = response.body["message"];
        for (dynamic info in response.body["data"]) {
          categories.add(CategoryModel.fromJson(info));
        }
        update();
      } else {
        error = response.body;
        loading = false;
        update();
      }
    } catch (err) {
      error = err.toString();
      message = "";
      loading = false;
      update();
    }
  }
}
