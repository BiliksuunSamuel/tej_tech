import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tej_tech/components/big_text.dart';
import 'package:tej_tech/constants/dimensions.dart';

class GroupTitleView extends StatelessWidget {
  final String title;
  final VoidCallback handlePress;
  Color? textColor = Colors.black;
  Color? iconColor = Colors.black;
  GroupTitleView(
      {Key? key,
      required this.title,
      required this.handlePress,
      this.iconColor,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.getwidth(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BigText(
            text: title,
            fontSize: Dimensions.getwidth(22),
          ),
          Container(
            alignment: Alignment.center,
            child: IconButton(
              icon: const Icon(Icons.chevron_right_outlined),
              iconSize: Dimensions.getwidth(16),
              color: Colors.black,
              onPressed: handlePress,
            ),
          )
        ],
      ),
    );
  }
}
