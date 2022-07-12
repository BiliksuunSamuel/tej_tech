import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tej_tech/app/model/category_model.dart';
import 'package:tej_tech/components/big_text.dart';
import 'package:tej_tech/components/small_text.dart';
import 'package:tej_tech/constants/dimensions.dart';
import 'package:tej_tech/controller/category_controller.dart';

class CategoriesContentSliver extends StatelessWidget {
  const CategoriesContentSliver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (categoryController) {
      Get.lazyPut(() => CategoryController());
      categoryController.handleGetCategories();
      // print(categoryController.categories.length);
      return SliverFillRemaining(
        child: Container(
            alignment: Alignment.center,
            child: ListView.builder(
                itemCount: categoryController.categories.length,
                itemBuilder: (BuildContext content, int index) {
                  CategoryModel item = categoryController.categories[index];
                  return Container(
                    padding: const EdgeInsets.all(5),
                    child: Row(children: [
                      Icon(
                        Icons.list_outlined,
                        size: Dimensions.getheight(24),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      BigText(
                        text: item.title,
                        fontSize: Dimensions.getfontsize(18),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Container(
                        width: Dimensions.getwidth(30),
                        height: Dimensions.getheight(30),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.getheight(30)),
                          color: const Color.fromRGBO(211, 211, 211, 211),
                        ),
                        child: SmallText(
                            text: item.subCategories.length.toString()),
                      ),
                      const SizedBox(
                        width: 8,
                      )
                    ]),
                  );
                })),
      );
    });
  }
}
