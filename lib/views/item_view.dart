import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tej_tech/components/icon_text.dart';
import 'package:tej_tech/components/small_text.dart';
import 'package:tej_tech/constants/constants.dart';
import 'package:tej_tech/constants/dimensions.dart';
import 'package:tej_tech/resources/resources.dart';
import 'package:tej_tech/screens/home/product_info_page.dart';

class ItemView extends StatelessWidget {
  final SliderItem item;
  const ItemView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() =>const ProductInfoPage(), transition: Transition.fadeIn);
      },
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(
              width: Dimensions.getwidth(Dimensions.w / 2.5),
              margin: EdgeInsets.all(Dimensions.getwidth(5)),
              height: Dimensions.getheight(150),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(item.image), fit: BoxFit.cover),
                  color: const Color.fromARGB(211, 211, 211, 211),
                  borderRadius: BorderRadius.circular(Dimensions.getwidth(5))),
            ),
            Align(
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.getwidth(10),
                ),
                child: Container(
                  margin: EdgeInsets.only(bottom: Dimensions.getheight(4)),
                  alignment: Alignment.center,
                  height: Dimensions.getheight(61.5),
                  width: Dimensions.getwidth(Dimensions.w / 2.7),
                  padding: EdgeInsets.all(
                    Dimensions.getheight(5),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(Dimensions.getwidth(5)),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 5,
                            color: Color.fromARGB(207, 211, 211, 211),
                            offset: Offset(0, 5)),
                      ]),
                  child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        SmallText(
                          text: item.name,
                          fontSize: Dimensions.getheight(13),
                          textColor: Colors.black,
                        ),
                        SizedBox(
                          height: Dimensions.getheight(2.5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmallText(
                              text: "${Constants.currency}${item.newPrice}",
                              fontSize: Dimensions.getheight(12),
                              textColor: Colors.black54,
                            ),
                            IconText(
                                text: "4.5",
                                icon: Icons.star_outline,
                                iconColor: Colors.orange,
                                iconSize: Dimensions.getheight(12))
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.getheight(2.5),
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: "Brand:",
                              fontSize: Dimensions.getheight(13),
                            ),
                            SizedBox(
                              width: Dimensions.getwidth(5),
                            ),
                            SmallText(
                              text: "New",
                              fontSize: Dimensions.getheight(13),
                              textColor: Colors.red,
                            )
                          ],
                        )
                      ]),
                  )
                  
                  ),)
          ],
        ),
      ),
    );
  }
}
