import 'package:flutter/material.dart';
import 'package:tej_tech/constants/dimensions.dart';

class SmallText extends StatelessWidget {
  final String text;
  double? fontSize = Dimensions.getwidth(14);
  TextDecoration? decoration;
  Color? textColor = Colors.black54;
  SmallText({Key? key, required this.text, this.fontSize, this.textColor,this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          overflow: TextOverflow.ellipsis,
          color: textColor,
          decoration:decoration ),
    );
  }
}
