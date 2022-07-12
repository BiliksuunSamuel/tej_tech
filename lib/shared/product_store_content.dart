import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tej_tech/resources/resources.dart';
import 'package:tej_tech/shared/store_item.dart';

class ProductStoreContent extends StatelessWidget {
  const ProductStoreContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: ListView.builder(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: Resources.airPods.length,
          itemBuilder: (BuildContext context, int index) {
            SliderItem item = Resources.airPods[index];
            return StoreItem(item: item,index: index,);
          }),
    );
  }
}
