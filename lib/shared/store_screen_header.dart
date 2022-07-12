
import 'package:flutter/material.dart';
import 'package:tej_tech/components/big_text.dart';

import 'package:tej_tech/constants/app_colors.dart';
import 'package:tej_tech/constants/dimensions.dart';
import 'package:tej_tech/shared/store_header_card.dart';

class StoreScreenHeader extends StatelessWidget {
  const StoreScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.primaryColor,
      automaticallyImplyLeading: false,
      expandedHeight:Dimensions.getheight(100),
      title:Container(
        padding: EdgeInsets.all(Dimensions.getheight(10)),
      ),
      pinned: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(Dimensions.getheight(40)),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.getheight(20)),
              topRight: Radius.circular(Dimensions.getheight(20))
            ),

          ),
          padding: EdgeInsets.symmetric(vertical: Dimensions.getheight(10),
          horizontal: Dimensions.getwidth(20)),
          child: Center(child: 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            BigText(text: "Products",fontSize: Dimensions.getheight(24),textColor: AppColors.primaryColor,)
          ],)),
        ),
        ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          padding: EdgeInsets.all(Dimensions.getheight(15)),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:const [
                StoreHeaderCard(color:Colors.red,icon: Icons.pending_outlined ,title:"Pending Orders"),
                StoreHeaderCard(color: Colors.green,icon: Icons.check_outlined,title:"Completed Orders")
              ],
            )
          ]),
        ),        
        ),
    );
  }
}
