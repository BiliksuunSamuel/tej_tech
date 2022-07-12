import 'package:flutter/material.dart';
import 'package:tej_tech/constants/dimensions.dart';

class TextIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  Color? textColor = Colors.white;
  Color? iconColor = Colors.white;
  double? fontSize = Dimensions.getwidth(14);
  double? iconSize = Dimensions.getwidth(16);
  TextIcon(
      {Key? key,
      required this.text,
      required this.icon,
      this.textColor,
      this.iconSize,
      this.iconColor,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
        Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
        
      ],
    );
  }
}
