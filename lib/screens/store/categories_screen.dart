import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tej_tech/components/big_text.dart';
import 'package:tej_tech/components/icon_text.dart';
import 'package:tej_tech/constants/app_colors.dart';
import 'package:tej_tech/constants/dimensions.dart';
import 'package:tej_tech/controller/category_controller.dart';
import 'package:tej_tech/screens/store/add_category_screen.dart';
import 'package:tej_tech/views/categories_content_sliver.dart';
import 'package:tej_tech/views/categories_sliver_appbar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      Get.lazyPut(() => CategoryController());
    return GetBuilder<CategoryController>(builder: (categoryController) {
      categoryController.handleGetCategories();
      return Scaffold(
        appBar: AppBar(
          title: BigText(
            text: "Product Categories",
            fontSize: Dimensions.getheight(18),
            textColor: Colors.white,
          ),
          backgroundColor: AppColors.primaryColor,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: AppColors.primaryColor,
              statusBarBrightness: Brightness.light),
          actions: [
            InkWell(
                onTap: () => Get.to(() => AddCategoryScreen()),
                child: IconText(text: "Add", icon: Icons.add_outlined)),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: const CustomScrollView(slivers: [
          CategoriesSliverAppbar(),
          CategoriesContentSliver(),
        ]),
      );
    });
  }
}
