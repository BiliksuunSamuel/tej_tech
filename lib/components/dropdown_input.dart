import 'package:flutter/material.dart';
import 'package:tej_tech/constants/app_colors.dart';
import 'package:tej_tech/constants/dimensions.dart';

class DropdownInput extends StatelessWidget {
  final String hint;
  final List<DropdownMenuItem> items;
  final dynamic value;
  final Function(dynamic value) handleChange;
  const DropdownInput(
      {Key? key,
      required this.items,
      required this.hint,
      required this.value,
      required this.handleChange})

      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Dimensions.getheight(50),
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(vertical: Dimensions.getheight(5)),
      child: DropdownButton(
        hint: Text(hint),
        items: items,
        onChanged: (dynamic data) {
          handleChange(data);
        },
        value: value,
        isExpanded: true,
        enableFeedback: true,
      ),
    );
  }
}
