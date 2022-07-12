import 'package:flutter/material.dart';
import 'package:tej_tech/components/big_text.dart';
import 'package:tej_tech/components/custom_button.dart';
import 'package:tej_tech/components/secondary_button.dart';
import 'package:tej_tech/constants/app_colors.dart';
import 'package:tej_tech/constants/dimensions.dart';
import 'package:tej_tech/shared/add_product_header.dart';
import 'package:tej_tech/shared/add_product_info_content.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        slivers: [
         AddProductHeader(),
          AddProductInfoContent()
        ],
      ),
    );
  }
}
