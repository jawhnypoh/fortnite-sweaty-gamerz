// Current Items Screen

import 'package:flutter/material.dart';
import 'package:fortnite_sweaty_gamerz/models/current_items_model.dart';
import 'package:fortnite_sweaty_gamerz/utilities/api_resources.dart';
import 'package:fortnite_sweaty_gamerz/utilities/utilities.dart';
import 'package:fortnite_sweaty_gamerz/views/SingleDailyItemView.dart';
import 'package:fortnite_sweaty_gamerz/views/SingleFeaturedItemView.dart';
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
                      buildFeaturedItemsGridList(
                          snapshot.data.data.featured, context),
                      const Padding(padding: EdgeInsets.only(bottom: 30.0)),
                      const Divider(color: Colors.grey),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Daily Items',
                              style: TextStyle(fontSize: 35.0))),
                      buildDailyItemsGridList(
                          snapshot.data.data.daily, context),
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

  Widget buildFeaturedItemsGridList(List items, BuildContext context) {
    return Container(
        height: 800.0,
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(items.length, (index) {
            return Container(
                margin: EdgeInsets.all(10.0),
                color: Utilities().determineBGColor(items[index].rarity),
                child: Center(
                    child: Stack(children: <Widget>[
                  buildFeaturedItemImageAndText(items[index], context),
                  buildItemPriceText(
                      items[index].price, items[index].priceIconLink),
                ])));
          }),
        ));
  }

  Widget buildDailyItemsGridList(List items, BuildContext context) {
    return Container(
        height: 800.0,
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(items.length, (index) {
            return Container(
                margin: EdgeInsets.all(10.0),
                color: Utilities().determineBGColor(items[index].rarity),
                child: Center(
                    child: Stack(children: <Widget>[
                  buildDailyItemImageAndText(items[index], context),
                  buildItemPriceText(
                      items[index].price, items[index].priceIconLink),
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

  Widget buildFeaturedItemImageAndText(Featured item, BuildContext context) {
    return InkWell(
      child: Container(
          width: 240,
          height: 240,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(item.shopImages.featured != ""
                      ? item.shopImages.featured
                      : item.shopImages.icon))),
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            color: Color(0xFF0E3311).withOpacity(0.7),
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                item.name,
                style: TextStyle(fontSize: 35.0),
                textAlign: TextAlign.center,
              ),
            ),
          )),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SingleFeaturedItemView(
                      featuredItem: item,
                    )));
      },
    );
  }

  Widget buildDailyItemImageAndText(Daily item, BuildContext context) {
    return InkWell(
      child: Container(
          width: 240,
          height: 240,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(item.shopImages.featured != ""
                      ? item.shopImages.featured
                      : item.shopImages.icon))),
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            color: Color(0xFF0E3311).withOpacity(0.7),
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                item.name,
                style: TextStyle(fontSize: 35.0),
                textAlign: TextAlign.center,
              ),
            ),
          )),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SingleDailyItemView(
                      dailyItem: item,
                    )));
      },
    );
  }
}
