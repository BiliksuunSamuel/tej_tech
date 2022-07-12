import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tej_tech/constants/dimensions.dart';

class ProfileAvatar extends StatelessWidget {
  // bool isRemote;
  // final String imageUrl;
  double width;
  double height;
  Color? color;
  ProfileAvatar({
    Key? key,
    this.color=Colors.white,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(width)
            ));
  }
}
