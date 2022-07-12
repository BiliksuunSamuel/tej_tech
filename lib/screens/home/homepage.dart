import 'package:flutter/material.dart';
import 'package:tej_tech/constants/dimensions.dart';
import 'package:tej_tech/resources/resources.dart';
import 'package:tej_tech/views/Sidebar.dart';
import 'package:tej_tech/views/group_title_view.dart';
import 'package:tej_tech/views/product_group_view.dart';
import 'package:tej_tech/views/navbar.dart';
import 'package:tej_tech/views/product_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      backgroundColor: Colors.white,
      body: ListView(
          shrinkWrap: true,
          physics:const AlwaysScrollableScrollPhysics(),
          children: [
          const ProductSlider(),
           SizedBox(height: Dimensions.getheight(5)),
           GroupTitleView(title: "Air Pods", handlePress: (){}),
           ProductGroupView(items: Resources.airPods,),
            GroupTitleView(title: "Mobile Phones", handlePress: (){}),
           ProductGroupView(items: Resources.phones,),
            GroupTitleView(title: "Computers", handlePress: (){}),
           ProductGroupView(items: Resources.computers,)
      ],),
     drawer:const Sidebar(),
    );
  }
}
