import 'package:flutter/material.dart';
import 'package:tej_tech/constants/app_colors.dart';
import 'package:tej_tech/constants/dimensions.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key,this.handleClick}) : super(key: key);
  VoidCallback? handleClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: Dimensions.getheight(40),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.getwidth(10)),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 5,
                color: Color.fromRGBO(211, 211, 211, 0.85))
          ],
          gradient: const LinearGradient(colors: [
            AppColors.primaryColor,
            Color.fromARGB(255, 124, 9, 59),
            Color.fromARGB(255, 143, 5, 65),
          ])),
      child: Expanded(
        child: TextButton(
            onPressed: handleClick,
            child: Text(
              "Submit",
              style: TextStyle(
                  color: Colors.white, fontSize: Dimensions.getheight(18)),
            )),
      ),
    );
  }
}
