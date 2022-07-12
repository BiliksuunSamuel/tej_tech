import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tej_tech/components/big_text.dart';
import 'package:tej_tech/components/small_text.dart';
import 'package:tej_tech/constants/dimensions.dart';

class ProductDescriptionLabel extends StatelessWidget {
  final String label;
  final String text;
  Color? labelColor;
  Color? textColor;
  double? labelSize;
  double? textSize;
  ProductDescriptionLabel({
    Key? key,
    required this.label,
    required this.text,
    this.labelColor = Colors.black,
    this.textColor = Colors.black,
    this.labelSize = 13,
    this.textSize = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Row(
      children: [
        SmallText(text: "$label:",textColor: labelColor,fontSize: labelSize,),
        SizedBox(width: Dimensions.getwidth(5),),
        BigText(text: text,fontSize: textSize,textColor: textColor,)
      ],
    ));
  }
}
