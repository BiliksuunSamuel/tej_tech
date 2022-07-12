import 'package:flutter/material.dart';
import 'package:tej_tech/components/big_text.dart';
import 'package:tej_tech/components/small_text.dart';
import 'package:tej_tech/constants/app_colors.dart';
import 'package:tej_tech/constants/constants.dart';
import 'package:tej_tech/constants/dimensions.dart';
import 'package:tej_tech/resources/resources.dart';

class StoreItem extends StatelessWidget {
  final SliderItem item;
  final int index;
  const StoreItem({Key? key, required this.item,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.getheight(10)),
      margin: EdgeInsets.only(bottom: Dimensions.getheight(8)),
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(Dimensions.getheight(15))),
          boxShadow: const [
            BoxShadow(
                blurRadius: 5,
                offset: Offset(0, 5),
                color: Color.fromARGB(190, 250, 247, 247)),
          ]),
      child: Row(children: [
        Container(
          width: Dimensions.getwidth(70),
          height: Dimensions.getheight(70),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(item.image), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(Dimensions.getheight(5)),
              color: AppColors.primaryColor),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.getwidth(15)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(
                  text: item.name,
                  fontSize: Dimensions.getheight(18),
                  textColor: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SmallText(
                        text: "${Constants.currency}${item.newPrice}",
                        fontSize: Dimensions.getheight(15),
                        textColor: Colors.black54),
                    SizedBox(
                      width: Dimensions.getwidth(5),
                    ),
                    SmallText(
                      text: "${Constants.currency}${item.oldPrice}",
                      fontSize: Dimensions.getheight(13),
                      textColor: Colors.black45,
                      decoration: TextDecoration.lineThrough,
                    ),
                    
                  ],
                ),
                SizedBox(
                  height: Dimensions.getheight(2),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.warning,
                      color: index%2==0?Colors.green:Colors.red,
                      size: Dimensions.getheight(12),
                    ),
                    SizedBox(
                      width: Dimensions.getwidth(3),
                    ),
                    SmallText(
                      text: "status:",
                      fontSize: Dimensions.getheight(12.5),
                    ),
                    SizedBox(
                      width: Dimensions.getwidth(3),
                    ),
                     SmallText(
                      text: index%2==0?"Available":"Unavailable",
                      textColor: index%2==0?Colors.green:Colors.red,
                      fontSize: Dimensions.getheight(12.5),
                    )
                  ],
                )
              ]),
        )
      ]),
    );
  }
}
