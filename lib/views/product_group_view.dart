import 'package:flutter/cupertino.dart';
import 'package:tej_tech/constants/dimensions.dart';
import 'package:tej_tech/resources/resources.dart';
import 'package:tej_tech/views/item_view.dart';

class ProductGroupView extends StatelessWidget {
  final ScrollController controller = ScrollController();
  final List<SliderItem> items;
  ProductGroupView({Key? key,required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.maxFinite,
      height: Dimensions.getheight(180),
      child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: controller,
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            SliderItem item = items[index];
            return ItemView(item: item);
          }),
    );
  }
}
