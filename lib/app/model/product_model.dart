import 'package:tej_tech/app/model/product_description_model.dart';

class ProductModel {
  late String productName;
  late List<ProductDescriptionModel> description = [];
  late double regularPrice = 0.0;
  late double sellingPrice = 0.0;
  late String about;
  late String category;
  late String group;
  late List<String> likes = [];
  late double rating = 0.0;
  late String image;
  late List<String> gallery = [];
  late int status = 0;
  late String userId;
  late String id;

  ProductModel.formJson(dynamic info) {
    productName = info["productName"];
    regularPrice = double.parse(info["regularPrice"]);
    sellingPrice = double.parse(info["sellingPrice"]);
    about = info["about"];
    category = info["category"];
    group = info["group"];
    likes = info["likes"] as List<String>;
    rating = double.parse(info["rating"]);
    image = info["image"];
    gallery = info["gallery"] as List<String>;
    status = int.parse(info["status"]);
    userId = info["userId"];
    description = info["description"] as List<ProductDescriptionModel>;
    id = info["id"];
  }
}
