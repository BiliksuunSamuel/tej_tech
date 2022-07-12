import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Paragraph extends StatelessWidget {
  final String text;
  Color? color;
  double? spacing;
  double? fontSize;
  Paragraph(
      {Key? key, this.color, this.fontSize, this.spacing, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        letterSpacing: spacing,
      ),
    );
  }
}
