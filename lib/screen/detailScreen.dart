import 'package:flutter/material.dart';

TextStyle _textStyle1 =
    TextStyle(fontSize: 21, letterSpacing: 1.2, fontWeight: FontWeight.bold);

TextStyle _textStyle2 =
    TextStyle(fontSize: 18, letterSpacing: 1.2, fontWeight: FontWeight.bold);

TextStyle _textStyle3 = TextStyle(fontSize: 18, letterSpacing: 0.9);

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  final title;
  String price;
  String desc;
  Image image;
  double review;

  DetailScreen({this.desc, this.image, this.review, this.price, this.title});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildCancelicon(context),
                buildImage(mq),
                buildTitletext(),
                SizedBox(
                  height: 12,
                ),
                buildPrice(),
                SizedBox(
                  height: 15,
                ),
                buildDesc(),
                SizedBox(
                  height: mq.height * 0.05,
                ),
                buildRatingReview(),
                SizedBox(
                  height: mq.height * 0.05,
                ),
                buildCartandLikes(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCartandLikes() {
    return Row(
      children: [
        Text(
          "Add to cart",
          style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 18,
              letterSpacing: 0.6),
        ),
        Spacer(),
        CircleAvatar(
            backgroundColor: Colors.black,
            radius: 30,
            child: IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  size: 30,
                ),
                onPressed: () {}))
      ],
    );
  }

  Widget buildRatingReview() {
    return Row(
      children: [
        Text(
          'Reviews',
          style: _textStyle2,
        ),
        SizedBox(width: 50),
        Text(
          widget.review.toString(),
          style: _textStyle2,
        ),
        Text("⭐"),
      ],
    );
  }

  Widget buildDesc() {
    return Text(
      widget.desc,
      style: _textStyle3,
    );
  }

  Widget buildPrice() {
    return Text(
      widget.price,
      style: _textStyle2,
    );
  }

  Widget buildTitletext() {
    return Text(
      widget.title,
      style: _textStyle1,
    );
  }

  Widget buildImage(Size mq) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 10),
      child: Center(
          child: Container(height: mq.height * 0.3, child: widget.image)),
    );
  }

  Widget buildCancelicon(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          Navigator.pop(context);
        });
  }
}
