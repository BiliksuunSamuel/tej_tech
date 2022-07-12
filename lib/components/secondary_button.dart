import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tej_tech/constants/app_colors.dart';
import 'package:tej_tech/constants/dimensions.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final VoidCallback handlePress;
  const SecondaryButton({Key? key,required this.handlePress,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.getheight(40),
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(
            width: Dimensions.getwidth(0.5),
            color: const Color.fromARGB(255, 214, 80, 138)),
        borderRadius: BorderRadius.circular(Dimensions.getwidth(8)),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextButton(
            onPressed:handlePress,
            child: Text(
              title,
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: Dimensions.getheight(15)),
            ))
      ]),
    );
  }
}
