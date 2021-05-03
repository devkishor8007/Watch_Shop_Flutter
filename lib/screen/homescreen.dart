import 'package:flutter/material.dart';
import 'package:watch_flutter/model/data_model.dart';
import 'package:watch_flutter/screen/detailScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> getListString = [
    'Trending',
    'Categories',
    'New Collection',
    'Brand-New'
  ];
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildFeatureandProductsText(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                buildColumnRotateText(),
                buildListImageView(mq, context),
              ],
            ),
            Spacer(),
            buildBottomPlace(mq),
          ],
        ),
      ),
    );
  }

  Widget buildBottomPlace(Size mq) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildIconBag(),
          SizedBox(
            width: 15,
          ),
          buildSelectCategoryItem(mq)
        ],
      ),
    );
  }

  Widget buildSelectCategoryItem(Size mq) {
    return Expanded(
      child: Container(
        height: 60,
        width: mq.width,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: getListString.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 16, left: 15),
                child: getListString[index] == getListString[0]
                    ? Text(
                        getListString[index],
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      )
                    : Text(
                        getListString[index],
                        style: TextStyle(fontSize: 19, color: Colors.black38),
                      ),
              );
            }),
      ),
    );
  }

  Widget buildIconBag() {
    return CircleAvatar(
        radius: 30,
        backgroundColor: Colors.black,
        child: Icon(
          Icons.shopping_bag,
          size: 35,
        ));
  }

  Widget buildColumnRotateText() {
    return Column(
      children: [
        buildRotateText('Colors'),
        buildRotateText('Strap'),
        buildRotateText('Brand'),
        buildRotateText('Size'),
      ],
    );
  }

  Widget buildListImageView(Size mq, BuildContext context) {
    return Expanded(
      child: Container(
        height: mq.height * 0.5,
        width: mq.width,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: getData.length ?? 0,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DetailScreen(
                                title: getData[index].title,
                                desc: getData[index].desc,
                                price: getData[index].price,
                                image: getData[index].image,
                                review: getData[index].review,
                              )));
                },
                child: Container(
                  width: mq.width * 0.6,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      title: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 35, bottom: 20),
                            child: Container(
                                height: mq.height * 0.2,
                                child: getData[index].image),
                          ),
                          Text(
                            getData[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                letterSpacing: 0.6),
                          ),
                          SizedBox(height: 25),
                          Row(
                            children: [
                              Text(getData[index].price),
                              Spacer(),
                              Text(getData[index].review.toString()),
                              Text("⭐"),
                            ],
                          ),
                          SizedBox(height: 25),
                          Row(
                            children: [
                              Text(
                                "Add to cart",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 18,
                                    letterSpacing: 0.6),
                              ),
                              Spacer(),
                              IconButton(
                                  icon: Icon(Icons.favorite_border),
                                  onPressed: () {})
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget buildFeatureandProductsText() {
    return Padding(
      padding: const EdgeInsets.only(top: 29, left: 55),
      child: Container(
        height: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextEasy(
                name: 'Featured',
                color: Colors.black38,
                fontSize: 25,
                fontWeight: null),
            buildTextEasy(
                name: 'Products',
                color: null,
                fontSize: 36,
                fontWeight: FontWeight.bold),
          ],
        ),
      ),
    );
  }

  Widget buildRotateText(String name) {
    return Padding(
      padding: const EdgeInsets.only(top: 22, left: 10, bottom: 15, right: 15),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(
          name,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget buildTextEasy(
      {String name, Color color, double fontSize, FontWeight fontWeight}) {
    return Text(
      name,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
