import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tej_tech/constants/dimensions.dart';

class BigText extends StatelessWidget {
  final String text;
  Color? textColor = Colors.white;
  bool? bold;
  double? fontSize = Dimensions.getwidth(24);

  BigText({Key? key, required this.text, this.fontSize, this.textColor,this.bold=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        overflow: TextOverflow.ellipsis,
        fontWeight: bold!=null?FontWeight.bold:FontWeight.normal
      ),
    );
  }
}
