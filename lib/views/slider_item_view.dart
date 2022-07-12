import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tej_tech/components/icon_text.dart';
import 'package:tej_tech/components/small_text.dart';
import 'package:tej_tech/components/text_icon.dart';
import 'package:tej_tech/constants/constants.dart';
import 'package:tej_tech/constants/dimensions.dart';
import 'package:tej_tech/resources/resources.dart';
import 'package:tej_tech/screens/home/product_info_page.dart';
import 'package:tej_tech/utilities/utilities.dart';

import '../components/big_text.dart';

class SliderItemView extends StatelessWidget {
  final bool isWeb = kIsWeb;
  final SliderItem item;
  final Matrix4 matrix;
  const SliderItemView({Key? key, required this.item, required this.matrix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() =>const ProductInfoPage(), transition: Transition.fadeIn);
      },
      child: Transform(
          transform: matrix,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: Dimensions.getwidth(8)),
                height: Dimensions.getheight(180),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(94, 236, 236, 234),
                    borderRadius:
                        BorderRadius.circular(Dimensions.getwidth(15)),
                    image: DecorationImage(
                        image: AssetImage(item.image), fit: BoxFit.cover)),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.getwidth(30)),
                    child: Container(
                      margin: EdgeInsets.only(bottom: Dimensions.getheight(10)),
                      padding: EdgeInsets.all(Dimensions.getwidth(10)),
                      height: Dimensions.getheight(80),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(68, 153, 152, 152),
                                offset: Offset(0, 5),
                                blurRadius: 5)
                          ],
                          borderRadius:
                              BorderRadius.circular(Dimensions.getwidth(10))),
                      child:Column(children: [
                        Row(
                          children: [
                            Expanded(
                              child: Row(children: [
                                BigText(
                                  text: item.name,
                                  fontSize: Dimensions.getheight(15),
                                  textColor: Colors.black87,
                                ),
                                Icon(
                                  Icons.new_releases,
                                  size: Dimensions.getheight(14),
                                  color: Colors.red,
                                )
                              ]),
                            ),
                            TextIcon(
                                text: "Bh",
                                fontSize: Dimensions.getheight(14),
                                iconSize: Dimensions.getheight(14),
                                iconColor: Colors.black54,
                                icon: Icons.battery_unknown_outlined),
                            SmallText(
                              text: "99%",
                              fontSize: Dimensions.getheight(13),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.getheight(2.5),
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                  5,
                                  (index) => Icon(Icons.star,
                                      color: Colors.orange,
                                      size: Dimensions.getheight(13))),
                            ),
                            SmallText(
                              text: "4.5",
                              textColor: Colors.black,
                              fontSize: Dimensions.getheight(13),
                            ),
                            SizedBox(
                              width: Dimensions.getwidth(8),
                            ),
                            Expanded(child: Container()),
                            IconText(
                              text: "100",
                              icon: Icons.thumb_up_outlined,
                              iconSize: Dimensions.getfontsize(14),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.getheight(5),
                        ),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SmallText(
                              text: "${Constants.currency}${item.newPrice}",
                              fontSize: Dimensions.getheight(14),
                            ),
                            SizedBox(
                              width: Dimensions.getwidth(5),
                            ),
                            SmallText(
                              text: "${Constants.currency}${item.oldPrice}",
                              textColor:
                                  const Color.fromARGB(255, 143, 140, 140),
                              fontSize: Dimensions.getheight(13),
                              decoration: TextDecoration.lineThrough,
                            ),
                            SizedBox(
                              width: Dimensions.getwidth(8),
                            ),
                            Expanded(child: Container()),
                            SmallText(
                              text:
                                  "${calculateDiscount(item.oldPrice, item.newPrice).toStringAsFixed(2)}% OFF",
                              fontSize: Dimensions.getheight(13),
                              textColor: const Color.fromARGB(255, 16, 139, 16),
                            )
                          ],
                        )
                      ]),),)
                    ),
            ],
          )),
    );
  }
}
