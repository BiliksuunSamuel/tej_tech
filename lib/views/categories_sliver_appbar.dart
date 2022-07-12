import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tej_tech/components/big_text.dart';
import 'package:tej_tech/constants/app_colors.dart';
import 'package:tej_tech/constants/dimensions.dart';

class CategoriesSliverAppbar extends StatelessWidget {
  const CategoriesSliverAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      backgroundColor: AppColors.primaryColor,
      automaticallyImplyLeading: false,
      pinned: true,
      bottom: PreferredSize(
        preferredSize:const Size.fromHeight(25),
        child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10))
        ),
        child: BigText(text:"Available Product Categories",fontSize: Dimensions.getheight(20),),
      ) ,),
    );
  }
}
