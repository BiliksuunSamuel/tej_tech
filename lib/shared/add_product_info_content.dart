import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tej_tech/app/model/category_model.dart';
import 'package:tej_tech/components/dropdown_input.dart';
import 'package:tej_tech/components/primary_button.dart';
import 'package:tej_tech/components/secondary_button.dart';
import 'package:tej_tech/constants/dimensions.dart';
import 'package:tej_tech/controller/category_controller.dart';
import 'package:tej_tech/controller/product_controller.dart';
import 'package:tej_tech/utilities/utilities.dart';

class AddProductInfoContent extends StatefulWidget {
  const AddProductInfoContent({Key? key}) : super(key: key);
  @override
  State<AddProductInfoContent> createState() => _AddProductInfoContentState();
}

class _AddProductInfoContentState extends State<AddProductInfoContent> {
  String category = "";
  // List<CategoryModel>categories=[];
  List<DropdownMenuItem> subCates = [];

  @override
  void initState() {
    // // TODO: implement initState
    // setState(() {
    //   subCates=getSubCategories(categories, id)
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (cateController) {
      Get.lazyPut(() => CategoryController());
      cateController.handleGetCategories();
      return SliverFillRemaining(
        child: Expanded(
            child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(Dimensions.getheight(10)),
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(labelText: "Product Name"),
                ),
                SizedBox(
                  height: Dimensions.getheight(5),
                ),
                DropdownInput(
                  items: getProductCategories(cateController.categories),
                  hint: "Product Category",
                  value:category,
                  handleChange: (data) {
                    setState(() {
                      category = data;
                      category =
                          getCategoryTitleById(cateController.categories, data);
                          
                      subCates =
                          getSubCategories(cateController.categories, data);
                    });
                  },
                ),
                DropdownInput(
                  items: subCates,
                  value: "",
                  hint: "Sub Category",
                  handleChange: (data) {
                    print(data);
                  },
                ),
                SizedBox(
                  height: Dimensions.getheight(5),
                ),
                const TextField(
                  decoration: InputDecoration(labelText: "Regular Price"),
                ),
                SizedBox(
                  height: Dimensions.getheight(5),
                ),
                const TextField(
                  decoration: InputDecoration(labelText: "Selling Price"),
                ),
                SizedBox(
                  height: Dimensions.getheight(15),
                ),
                SecondaryButton(
                    handlePress: () {}, title: "Add Product Description"),
                SizedBox(
                  height: Dimensions.getheight(15),
                ),
                GetBuilder<ProductController>(builder: (productController) {
                  return PrimaryButton(
                    title: "Submit",
                    handlePress: () {},
                  );
                })
              ],
            ),
          ),
        )),
      );
    });
  }
}
