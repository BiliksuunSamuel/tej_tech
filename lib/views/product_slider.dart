import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tej_tech/constants/dimensions.dart';
import 'package:tej_tech/resources/resources.dart';
import 'package:tej_tech/views/slider_item_view.dart';

class ProductSlider extends StatefulWidget {
  const ProductSlider({Key? key}) : super(key: key);

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  PageController controller = PageController(viewportFraction: 0.85);
  Matrix4 matrix = Matrix4.identity();
  double currentPageValue = 0;
  final double scaleFactor = 0.85;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:  EdgeInsets.only(top:  Dimensions.getheight(10), bottom:  Dimensions.getheight(20)),
      color: Colors.white,
      height:  Dimensions.getheight(250),
      width: double.maxFinite,
      child: PageView.builder(
          controller: controller,
          physics:const AlwaysScrollableScrollPhysics(),
          itemCount: Resources.slideItems.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == currentPageValue.floor()) {
              double currentScale =
                  1 - (currentPageValue - index) * (1 - scaleFactor);
              double currentTrans =
                  Dimensions.getheight(180) * (1 - currentScale) / 2;
              matrix = Matrix4.diagonal3Values(1, currentScale, 1)
                ..setTranslationRaw(0, currentTrans, 0);
            } else if (index == currentPageValue.floor() + 1) {
              double currentScale = scaleFactor +
                  (currentPageValue - index + 1) * (1 - scaleFactor);
              double currentTrans =
                  Dimensions.getheight(180) * (1 - currentScale) / 2;
              matrix = Matrix4.diagonal3Values(1, currentScale, 1);
              matrix = Matrix4.diagonal3Values(1, currentScale, 1)
                ..setTranslationRaw(0, currentTrans, 0);
            } else if (index == currentPageValue.floor() - 1) {
              double currentScale =
                  1 - (currentPageValue - index) * (1 - scaleFactor);
              double currentTrans =
                  Dimensions.getheight(180) * (1 - currentScale) / 2;
              matrix = Matrix4.diagonal3Values(1, currentScale, 1);
              matrix = Matrix4.diagonal3Values(1, currentScale, 1)
                ..setTranslationRaw(0, currentTrans, 0);
            } else {
              double currentScale = 0.8;
              matrix = Matrix4.diagonal3Values(1, currentScale, 1)
                ..setTranslationRaw(
                    0, Dimensions.getheight(180) * (1 - scaleFactor) / 2, 0);
            }
            SliderItem item = Resources.slideItems[index];
            return SliderItemView(
              matrix: matrix,
              item: item,
            );
          }),
    );
  }
}
