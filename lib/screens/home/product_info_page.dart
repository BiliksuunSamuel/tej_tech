import 'package:flutter/material.dart';
import 'package:tej_tech/components/big_text.dart';
import 'package:tej_tech/components/custom_icon_button.dart';
import 'package:tej_tech/components/paragraph.dart';
import 'package:tej_tech/components/product_description_label.dart';
import 'package:tej_tech/components/small_text.dart';
import 'package:tej_tech/constants/app_colors.dart';
import 'package:tej_tech/constants/constants.dart';
import 'package:tej_tech/constants/dimensions.dart';
import 'package:tej_tech/resources/resources.dart';
import 'package:tej_tech/utilities/utilities.dart';
import 'package:tej_tech/views/group_title_view.dart';
import 'package:tej_tech/views/product_group_view.dart';

class ProductInfoPage extends StatelessWidget {
  const ProductInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: CustomScrollView(
              shrinkWrap: true,
              physics:const AlwaysScrollableScrollPhysics(),
              slivers: [
              SliverAppBar(
                  backgroundColor: AppColors.primaryColor,
                  expandedHeight: Dimensions.getheight(270),
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconButton(
                          handlePress: () {},
                          icon: Icons.chevron_left_outlined,
                          iconSize: Dimensions.getheight(18),
                        ),
                        CustomIconButton(
                          handlePress: () {},
                          icon: Icons.add_shopping_cart,
                          iconSize: Dimensions.getheight(18),
                        )
                      ]),
                  pinned: true,
                  automaticallyImplyLeading: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      "assets/airpods17.jpg",
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(Dimensions.getheight(30)),
                    child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.getheight(8),
                            horizontal: Dimensions.getwidth(15)),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft:
                                    Radius.circular(Dimensions.getheight(15)),
                                topRight:
                                    Radius.circular(Dimensions.getheight(15))),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 5,
                                  color: Color.fromARGB(141, 161, 157, 157),
                                  offset: Offset(0, -1.5))
                            ]),
                        child: Column(
                          children: [
                            Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BigText(
                                    text: "Product Name",
                                    textColor: Colors.black,
                                    fontSize: Dimensions.getfontsize(18),
                                  ),
                                  Row(
                                    children: [
                                      SmallText(
                                          text: "${Constants.currency}450"),
                                      SizedBox(
                                        width: Dimensions.getwidth(10),
                                      ),
                                      SmallText(
                                        text:
                                            "${calculateDiscount(500, 450).toStringAsFixed(1)}% OFF",
                                        fontSize: Dimensions.getwidth(14),
                                        textColor: AppColors.primaryColor,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  )),
              SliverFillRemaining(
                child:Expanded(child: 
                SingleChildScrollView(
                  physics:const NeverScrollableScrollPhysics(),
                  child:  Container(
                  height: double.maxFinite,
                  padding: EdgeInsets.all(Dimensions.getwidth(10)),
                  child: Column(children: [
                    ProductDescriptionLabel(
                        label: "Device Category",
                        labelSize: Dimensions.getwidth(14),
                        labelColor: Colors.black54,
                        text: "Apple"),
                    const Divider(),
                    ProductDescriptionLabel(
                        label: "IOS Version",
                        labelSize: Dimensions.getwidth(14),
                        labelColor: Colors.black54,
                        text: "14"),
                    const Divider(),
                    ProductDescriptionLabel(
                        label: "Battery Health",
                        labelSize: Dimensions.getwidth(14),
                        labelColor: Colors.black54,
                        text: "95%"),
                    const Divider(),
                    ProductDescriptionLabel(
                        label: "Storage",
                        labelSize: Dimensions.getwidth(14),
                        labelColor: Colors.black54,
                        text: "256GB"),
                    const Divider(),
                    ProductDescriptionLabel(
                        label: "Usage Status",
                        labelSize: Dimensions.getwidth(14),
                        textColor: AppColors.primaryColor,
                        labelColor: Colors.black54,
                        text: "New"),
                    const Divider(),
                    ProductDescriptionLabel(
                        label: "Delivery",
                        labelSize: Dimensions.getwidth(14),
                        labelColor: Colors.black54,
                        text: "Free Delivery"),
                    const Divider(),
                    ProductDescriptionLabel(
                        label: "Delivery Duration",
                        labelSize: Dimensions.getwidth(14),
                        textColor: Colors.red,
                        labelColor: Colors.black54,
                        text: "Delivered Upon Order"),
                    const Divider(),
                    SmallText(
                      text: "Miscelleneous",
                      textColor: Colors.black,
                      fontSize: Dimensions.getwidth(16),
                    ),
                    const Divider(),
                    Paragraph(
                      text:
                          "The iPhone is a smartphone made by Apple that combines a computer, iPod, digital camera and cellular phone into one device with a touchscreen interface. The iPhone runs the iOS operating system, and in 2021 when the iPhone 13 was introduced, it offered up to 1 TB of storage and a 12-megapixel camera",
                      fontSize: Dimensions.getheight(16),
                      spacing: Dimensions.getheight(1.5),
                    ),
                    const Divider(),
                    GroupTitleView(title: "Related Item", handlePress: () {}),
                    ProductGroupView(items: Resources.phones),
                  ]),
                ),),)
              )
            ])));
  }
}
