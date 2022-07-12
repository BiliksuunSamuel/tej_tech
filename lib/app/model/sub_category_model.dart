class SubCategoryModel {
  late String title;
  late String id;

  SubCategoryModel.fromJson(dynamic info) {
    title = info["title"];
    id = info["id"];
  }
}
