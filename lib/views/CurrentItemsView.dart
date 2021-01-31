// Current Items Screen

import 'package:flutter/material.dart';
import 'package:fortnite_sweaty_gamerz/models/current_items_model.dart';
import 'package:fortnite_sweaty_gamerz/utilities/api_resources.dart';
import 'package:fortnite_sweaty_gamerz/utilities/utilities.dart';
import 'package:intl/intl.dart';

class CurrentItemsView extends StatelessWidget {
  const CurrentItemsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Image.asset('images/br-logo.png', fit: BoxFit.contain, height: 32),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0),
        child: SingleChildScrollView(
          child: FutureBuilder<CurrentItemsModel>(
            future: ApiResources().getCurrentItemShopResults(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: Column(
                    children: <Widget>[
                      const Padding(padding: EdgeInsets.only(top: 20.0)),
                      buildDateTime(),
                      const Padding(padding: EdgeInsets.only(bottom: 40.0)),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Featured Items',
                              style: TextStyle(fontSize: 35.0))),
                      const Padding(padding: EdgeInsets.only(bottom: 5.0)),
                      buildItemsGridList(snapshot.data.data.featured),
                      const Padding(padding: EdgeInsets.only(bottom: 30.0)),
                      const Divider(color: Colors.grey),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Daily Items',
                              style: TextStyle(fontSize: 35.0))),
                      buildItemsGridList(snapshot.data.data.daily),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return buildProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildProgressIndicator() {
    return const Padding(
      padding: EdgeInsets.all(100.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget buildDateTime() {
    // Get the current date to display on top of screen
    DateTime currentDate = new DateTime.now();
    String formattedDate = new DateFormat('yMMMMd').format(currentDate);

    return Container(
        child: Center(
            child: Text(
      formattedDate,
      style: TextStyle(fontSize: 50.0),
    )));
  }

  Widget buildItemsGridList(List featuredItems) {
    return Container(
        height: 800.0,
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(featuredItems.length, (index) {
            return Container(
                margin: EdgeInsets.all(10.0),
                color:
                    Utilities().determineBGColor(featuredItems[index].rarity),
                child: Center(
                    child: Stack(children: <Widget>[
                  buildItemImageAndText(featuredItems[index].name,
                      featuredItems[index].shopImages.icon),
                  buildItemPriceText(featuredItems[index].price,
                      featuredItems[index].priceIconLink),
                ])));
          }),
        ));
  }

  Widget buildItemPriceText(String price, String vBucksLink) {
    return Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 5.0, right: 2.0),
              width: 25.0,
              height: 25.0,
              decoration: BoxDecoration(
                  image: new DecorationImage(image: NetworkImage(vBucksLink))),
            ),
            Text(price, style: TextStyle(fontSize: 20.0))
          ],
        ));
  }

  Widget buildItemImageAndText(String name, String imageLink) {
    return Container(
        width: 240,
        height: 240,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(imageLink))),
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          color: Color(0xFF0E3311).withOpacity(0.7),
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              name,
              style: TextStyle(fontSize: 35.0),
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}
