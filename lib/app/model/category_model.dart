import 'package:tej_tech/app/model/sub_category_model.dart';

class CategoryModel {
  late String title;
  late String id;
  late List<SubCategoryModel> subCategories=[];

  CategoryModel.fromJson(dynamic info) {
    title = info["title"];
    id = info["_id"];
    for (dynamic subInfo in info["subCategories"]) {
      subCategories.add(SubCategoryModel.fromJson(subInfo));
    }
  }
}
