import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tej_tech/constants/app_colors.dart';
import 'package:tej_tech/constants/dimensions.dart';

class DrawerLink extends StatelessWidget {
  final IconData icon;
  final VoidCallback handlePress;
  final String text;
  Color? color;
  DrawerLink({
    Key? key,
    required this.icon,
    required this.text,
    required this.handlePress,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: handlePress,
        style:
            TextButton.styleFrom(primary: Color.fromRGBO(255, 255, 255, 0.45)),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: Dimensions.getwidth(20),
            ),
            SizedBox(
              width: Dimensions.getwidth(10),
            ),
            Text(
              text,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white, fontSize: Dimensions.getwidth(18)),
            )
          ],
        ));
  }
}
