import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tej_tech/components/big_text.dart';
import 'package:tej_tech/constants/app_colors.dart';
import 'package:tej_tech/constants/dimensions.dart';

PreferredSizeWidget Navbar() {
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    systemOverlayStyle:const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: AppColors.primaryColor,
    ),
    title: Row(children: [
      Container(width: Dimensions.getwidth(40),height: Dimensions.getheight(40),decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.getheight(40)),color: Colors.white),),
      SizedBox(width: Dimensions.getwidth(10),),
      Expanded(child: BigText(text: "Tej Tech",)),
      IconButton(onPressed: (){}, icon:const Icon(Icons.search)),
      IconButton(onPressed: (){}, icon:const Icon(Icons.shopping_cart_outlined)),
    ]),
  );
}
