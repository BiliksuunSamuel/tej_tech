import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tej_tech/components/big_text.dart';
import 'package:tej_tech/components/icon_text.dart';
import 'package:tej_tech/constants/app_colors.dart';
import 'package:tej_tech/constants/dimensions.dart';
import 'package:tej_tech/screens/store/add_product_screen.dart';
import 'package:tej_tech/shared/product_store_content.dart';
import 'package:tej_tech/shared/store_screen_header.dart';

class ProductStoreScreen extends StatelessWidget {
  const ProductStoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        systemOverlayStyle:const SystemUiOverlayStyle(
          statusBarColor: AppColors.primaryColor,
          statusBarBrightness: Brightness.light,
        ),
        title: Container(
          alignment: Alignment.center,
         child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            BigText(text: "Tej Tech",textColor:Colors.white,fontSize: Dimensions.getheight(22),),
            Expanded(child: Container()),
            IconText(text: "100", icon: Icons.store_rounded),
            SizedBox(width: Dimensions.getwidth(10),),
            IconButton(onPressed: 
            ()=>Get.to(()=>const AddProductScreen(),transition: Transition.zoom),
             icon:const Icon(
              Icons.add
            ))
          ],)
        ),
      ),
      body:const CustomScrollView(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [
            StoreScreenHeader(),
            ProductStoreContent()
          ],
        ),
    );
  }
}
