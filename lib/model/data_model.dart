import 'package:flutter/cupertino.dart';

class Data {
  String title;
  String price;
  String desc;
  Image image;
  double review;

  Data({this.title, this.desc, this.image, this.price, this.review});
}

List<Data> getData = [
  Data(
      title: "Timex Men's Expedition Acadia",
      desc:
          "Adjustable black & brown 20 millimeter genuine leather and fabric strap fits up to 8-inch wrist circumference. Black dial with full Arabic numerals; Date window at 3 o'clock; 24-hour military time",
      price: "\$350",
      review: 3.5,
      image: Image.asset(
        "assets/watch_one.png",
        fit: BoxFit.cover,
      )),
  Data(
    title: "Fossil Men's Neutra Stainless",
    desc:
        "Fossil is inspired by American creativity and ingenuity. Bringing new life into the watch and leathers industry by making quality, fashionable accessories that are both fun and accessible.",
    price: "\$450",
    review: 3.8,
    image: Image.asset(
      "assets/watch_two.png",
      fit: BoxFit.cover,
    ),
  ),
  Data(
      title: "MIDO - Men's Watch - M0014311103102",
      desc:
          "Silver-tone dial with date and day display, Brushed and polished stainless steel band and Swiss Automatic chronometer movement.",
      price: "\$350",
      review: 3.6,
      image: Image.asset(
        "assets/watch_three.png",
        fit: BoxFit.cover,
      )),
  Data(
      title: "Rolex Submariner",
      desc:
          "Blue dial enhanced by gold-tone mercedes-logo, sword, and breguet-style shape hands. Silver-tone stainless steel case with a two-tone (silver-tone and yellow gold-tone) stainless steel and 18kt yellow gold rolex oyster band. Automatic movement. 300 meters / 1000 feet water resistance. Uni-directional Rotating Coin Edge bezel",
      price: "\$18,495",
      review: 4.9,
      image: Image.asset(
        "assets/watch_four.png",
        fit: BoxFit.cover,
      )),
];
