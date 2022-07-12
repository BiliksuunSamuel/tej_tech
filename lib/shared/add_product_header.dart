import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tej_tech/components/big_text.dart';
import 'package:tej_tech/constants/app_colors.dart';
import 'package:tej_tech/constants/dimensions.dart';
import 'package:tej_tech/controller/product_controller.dart';
import 'package:tej_tech/resources/resources.dart';
import 'package:tej_tech/utilities/index.dart';

class AddProductHeader extends StatelessWidget {
  const AddProductHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProductController());
    return SliverAppBar(
      backgroundColor: AppColors.primaryColor,
      title: Container(),
      pinned: true,
      expandedHeight: Dimensions.getheight(270),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(Dimensions.getheight(40)),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.getwidth(20),
              vertical: Dimensions.getheight(10)),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.getheight(15)),
                  topRight: Radius.circular(Dimensions.getheight(15)))),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(
                text: "Product Details",
                fontSize: Dimensions.getheight(24),
                textColor: AppColors.primaryColor,
                bold: true,
              ),
              GetBuilder<ProductController>(builder: (productController) {
                return IconButton(
                    onPressed: () async {
                      FilePickerResult? results =
                          await FilePicker.platform.pickFiles(
                        type: FileType.image,
                        allowMultiple: true,
                        dialogTitle: "Choose Product Image(s)",
                        withData: true,
                        withReadStream: true,
                      );
                      if (results != null && results.files.isNotEmpty) {
                        productController
                            .handleImageUpload(convertBase64(results.files.first.bytes!),results.files.first.name);
                      }
                    },
                    icon: const Icon(Icons.add_a_photo_outlined));
              })
            ],
          )),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.getheight(10))),
          child: PageView.builder(
              itemCount: Resources.computers.length,
              itemBuilder: (BuildContext context, int index) {
                SliderItem item = Resources.computers[index];
                return Container(
                  width: double.maxFinite,
                  height: Dimensions.getheight(245),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.getheight(15)),
                      image: DecorationImage(
                          image: AssetImage(item.image), fit: BoxFit.cover)),
                );
              }),
        ),
      ),
    );
  }
}
