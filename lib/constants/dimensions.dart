import 'package:get/get.dart';

class Dimensions {
  static double width = Get.context!.width;
  static double height = Get.context!.height;
  static const double w = 360;
  static const double h = 752;

  static double getheight(double value) {
    double fraction = h / value;
    return (height) / (fraction);
  }

  static double getwidth(double value) {
    double fraction = w / value;
    return (width) / (fraction);
  }

 static double getfontsize(double size) {
    double fraction = h / size;
    return height / fraction;
  }
}
