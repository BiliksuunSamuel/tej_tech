import 'package:flutter/material.dart';
import 'package:tej_tech/constants/dimensions.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback handlePress;
  Color?color;
 CustomTextButton({Key? key,required this.text,required this.handlePress,this.color=Colors.white,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextButton(
        onPressed: handlePress,
        style: TextButton.styleFrom(
          primary:const Color.fromRGBO(255, 255, 255, 0.45),
          textStyle: const TextStyle(
          )
        ),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: Dimensions.getwidth(18),
          color: color,
        ),
      ),
    ));
  }
}
