class Resources {
  static  List<SliderItem> slideItems = [
    SliderItem("Iphone 11 Pro", "assets/phone9.jpg", 3000, 2800),
    SliderItem("AirPods Pro", "assets/airpod1.jpg", 600, 500),
    SliderItem("HP Pavilion", "assets/pc1.jpg", 3500, 3300),
  ];
   static  List<SliderItem> airPods = [
    SliderItem("AirPods Pro", "assets/airpods0.jpg", 600, 500),
    SliderItem("AirPods Pro", "assets/airpods5.jpg", 600, 500),
    SliderItem("AirPods Pro", "assets/airpods20.jpg", 600, 500),
    SliderItem("AirPods Pro", "assets/airpods18.jpg", 600, 500),
    SliderItem("AirPods Pro", "assets/airpods12.jpg", 600, 500),
    SliderItem("AirPods Pro", "assets/airpods19.jpg", 600, 500),
    SliderItem("AirPods Pro", "assets/airpods14.jpg", 600, 500),
    SliderItem("AirPods Pro", "assets/airpods17.jpg", 600, 500),
  ];
   static  List<SliderItem> computers = [
    SliderItem("HP Pavilion", "assets/pc1.jpg", 3500, 3300),
    SliderItem("HP Pavilion", "assets/pc2.jpg", 3500, 3300),
    SliderItem("HP Pavilion", "assets/pc3.jpg", 3500, 3300),
    SliderItem("HP Pavilion", "assets/pc4.jpg", 3500, 3300),
  ];
   static  List<SliderItem> phones = [
    SliderItem("Iphone 11 Pro", "assets/phone2.jpg", 3000, 2800),
    SliderItem("Iphone 11 Pro", "assets/phone3.jpg", 3000, 2800),
    SliderItem("Iphone 11 Pro", "assets/phone1.jpg", 3000, 2800),
    SliderItem("Iphone 11 Pro", "assets/phone4.jpg", 3000, 2800),
    SliderItem("Iphone 11 Pro", "assets/phone5.jpg", 3000, 2800),
    SliderItem("Iphone 11 Pro", "assets/phone6.jpg", 3000, 2800),
    SliderItem("Iphone 11 Pro", "assets/phone7.jpg", 3000, 2800),
    SliderItem("Iphone 11 Pro", "assets/phone8.jpg", 3000, 2800),
    SliderItem("Iphone 11 Pro", "assets/phone9.jpg", 3000, 2800),
  ];
}

class SliderItem {
  late String name;
  late String image;
  late double oldPrice;
  late double newPrice;

  SliderItem(this.name, this.image, this.oldPrice, this.newPrice);
}
