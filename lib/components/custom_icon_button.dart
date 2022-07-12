import 'package:flutter/material.dart';
import 'package:tej_tech/constants/dimensions.dart';

class CustomIconButton extends StatelessWidget {
  Color? color = Colors.black;
  Color? iconColor = Colors.white;
  double? iconSize = Dimensions.getheight(14);
  final IconData icon;
  final VoidCallback handlePress;
  CustomIconButton(
      {Key? key,
      required this.handlePress,
      this.color = Colors.white,
      this.iconColor = Colors.black,
      required this.icon,
      this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.getheight(40),
      height: Dimensions.getheight(40),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(40), color: color),
      child: IconButton(icon: Icon(icon),color: iconColor,onPressed: handlePress,),
    );
  }
}
