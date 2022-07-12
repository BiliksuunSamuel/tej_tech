import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tej_tech/app/model/sub_category_model.dart';
import 'package:tej_tech/components/big_text.dart';
import 'package:tej_tech/components/custom_button.dart';
import 'package:tej_tech/components/custom_text_button.dart';
import 'package:tej_tech/components/small_text.dart';
import 'package:tej_tech/constants/app_colors.dart';
import 'package:tej_tech/constants/dimensions.dart';
import 'package:tej_tech/controller/category_controller.dart';
import 'package:tej_tech/params/new_category_info.dart';
import 'package:tej_tech/params/new_sub_category_info.dart';
import 'package:tej_tech/utilities/utilities.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  NewCategoryInfo category = NewCategoryInfo();
  CategoryController categoryController = CategoryController();
  String subCateTitle = "";
  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => CategoryController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: BigText(
          text: "New Category",
          fontSize: Dimensions.getheight(20),
        ),
        backgroundColor: AppColors.primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.primaryColor,
            statusBarBrightness: Brightness.light),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromARGB(255, 214, 211, 211),
            expandedHeight: Dimensions.getheight(300),
            flexibleSpace: Container(
              alignment: Alignment.center,
              width: double.maxFinite,
              padding: EdgeInsets.only(top:Dimensions.getheight(8),bottom:Dimensions.getheight(35),right: Dimensions.getheight(8),left: Dimensions.getheight(8)),
              margin: EdgeInsets.all(Dimensions.getheight(5)),
              child: ListView.builder(
                  physics:const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: category.subCategories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: Dimensions.getheight(4)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      padding: EdgeInsets.all(Dimensions.getheight(5)),
                      alignment: Alignment.center,
                      height: Dimensions.getheight(30),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.category_outlined,
                              size: Dimensions.getheight(18),
                            ),
                            SizedBox(
                              width: Dimensions.getwidth(5),
                            ),
                            BigText(text: category.subCategories[index].title),
                            Expanded(child: Container()),
                            Container(
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      category.subCategories.remove(
                                          category.subCategories[index]);
                                    });
                                  },
                                  child: Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                    size: Dimensions.getheight(18),
                                  ),
                                )),
                            SizedBox(
                              width: Dimensions.getwidth(10),
                            )
                          ]),
                    );
                  }),
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(Dimensions.getheight(20)),
                child: Container(
                  padding: EdgeInsets.all(Dimensions.getheight(10)),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.getheight(10)),
                          topRight: Radius.circular(Dimensions.getheight(10)))),
                  child: BigText(
                    text: "Category Info",
                    fontSize: Dimensions.getheight(22),
                  ),
                )),
          ),
          SliverFillRemaining(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(Dimensions.getheight(5)),
              child: ListView(
                children: [
                SizedBox(
                  height: Dimensions.getheight(5),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Category Title",
                      label: SmallText(
                        text: "Title",
                      )),
                  onChanged: (text) {
                    setState(() {
                      category.title = text;
                      category.id = generateId();
                    });
                  },
                ),
                SizedBox(
                  height: Dimensions.getheight(15),
                ),
                BigText(
                  text: "Sub Categories",
                  fontSize: Dimensions.getheight(18),
                ),
                SizedBox(
                  height: Dimensions.getheight(10),
                ),
                TextField(
                  decoration: InputDecoration(
                      label: SmallText(
                        text: "SubCategory Title",
                      ),
                      hintText: "subCategory Title"),
                  onChanged: (text) {
                    setState(() {
                      subCateTitle = text;
                    });
                  },
                ),
                SizedBox(
                  height: Dimensions.getheight(10),
                ),
                Container(
                  width: double.maxFinite,
                  height: Dimensions.getheight(35),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(211, 211, 211, 1),
                      borderRadius:
                          BorderRadius.circular(Dimensions.getheight(10))),
                  child: CustomTextButton(
                    text: "Add to List",
                    handlePress: () {
                      setState(() {
                        NewSubCategoryInfo nsc = NewSubCategoryInfo();
                        nsc.title = subCateTitle;
                        nsc.id = generateId();
                        category.subCategories.add(nsc);
                        subCateTitle = "";
                      });
                    },
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: Dimensions.getheight(10),
                ),
                CustomButton(
                  handleClick: () {
                    List<dynamic> subcates = [];
                    for (NewSubCategoryInfo cate in category.subCategories) {
                      subcates.add({"title": cate.title, "id": cate.id});
                    }
                    var data = {
                      "title": category.title,
                      "subCategories":subcates,
                    };
                    categoryController.handleAddCategory(data);
                  },
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
