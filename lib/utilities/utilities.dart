import 'package:flutter/material.dart';
import 'package:tej_tech/app/model/sub_category_model.dart';
import 'package:uuid/uuid.dart';

import '../app/model/category_model.dart';

double calculateDiscount(double oldPrice, double newPrice) {
  return ((oldPrice - newPrice) / newPrice) * 100;
}

List<DropdownMenuItem> getProductCategories(List<CategoryModel> categories) {
  List<DropdownMenuItem> data = [];
  for (CategoryModel cate in categories) {
    data.add(DropdownMenuItem(
      value: cate.id,
      child: Text(cate.title),
    ));
  }
  return data;
}

List<DropdownMenuItem> getSubCategories(
    List<CategoryModel> categories, String id) {
    List<DropdownMenuItem> data = [];
    for (CategoryModel cate in categories) {
      if(cate.id==id){
        data.add(DropdownMenuItem(
          value: cate.id,
          child: Text(cate.title),
        ));
      }
    }
    return data;
  
}

String getCategoryTitleById(List<CategoryModel> categories, String id) {
  CategoryModel? info = categories.where((element) => element.id == id) as CategoryModel?;
  if (info != null) {
    return info.title;
  } else {
    return "";
  }
}

String generateId() {
  Uuid uuid = const Uuid();
  return uuid.v4();
}
