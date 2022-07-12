import 'package:flutter/material.dart';
import 'package:tej_tech/components/big_text.dart';
import 'package:tej_tech/components/small_text.dart';
import 'package:tej_tech/constants/dimensions.dart';

class StoreHeaderCard extends StatelessWidget {
  final Color color;
  final IconData icon;
 final String title;
  const StoreHeaderCard({Key? key, required this.color, required this.icon,required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.getheight(30),
      alignment: Alignment.center,
      padding: EdgeInsets.all(Dimensions.getheight(5)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.getheight(15)),
        boxShadow: const [
          BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 5,
              color: Color.fromARGB(92, 211, 211, 211)),
        ],
      ),
      child:Expanded(child: 
      SingleChildScrollView(child:  Column(children: [
        Row(
          children: [
            Icon(
              icon,
              color: color,
              size: Dimensions.getheight(18),
            ),
            SmallText(
              text: title,
              textColor: color,
              fontSize: Dimensions.getheight(12.5),
            ),
            SizedBox(
              width: Dimensions.getwidth(5),
            ),
            BigText(
              text: "10",
              fontSize: Dimensions.getheight(18),
            )
          ],
        ),
      ])),)
    );
  }
}
