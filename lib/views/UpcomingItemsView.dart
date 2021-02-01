// Upcoming Items Screen

import 'package:flutter/material.dart';
import 'package:fortnite_sweaty_gamerz/models/upcoming_items_model.dart';
import 'package:fortnite_sweaty_gamerz/utilities/api_resources.dart';
import 'package:fortnite_sweaty_gamerz/utilities/utilities.dart';
import 'package:fortnite_sweaty_gamerz/views/SingleUpcomingItemView.dart';

class UpcomingItemsView extends StatelessWidget {
  const UpcomingItemsView({Key key}) : super(key: key);

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
          child: FutureBuilder<UpcomingItemsModel>(
            future: ApiResources().getUpcomingItemShopResults(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: Column(
                    children: <Widget>[
                      const Padding(padding: EdgeInsets.only(top: 20.0)),
                      Container(
                          child: Center(
                              child: Text(
                        'Upcoming Items',
                        style: TextStyle(fontSize: 45.0),
                      ))),
                      const Padding(padding: EdgeInsets.only(bottom: 20.0)),
                      buildItemsGridList(snapshot.data.data, context)
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

  Widget buildItemsGridList(List upcomingItems, context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(upcomingItems.length, (index) {
            return Container(
                margin: EdgeInsets.all(10.0),
                color:
                    Utilities().determineBGColor(upcomingItems[index].rarity),
                child: Center(
                    child: Stack(children: <Widget>[
                  buildItemImageAndText(upcomingItems[index], context)
                ])));
          }),
        ));
  }

  Widget buildItemImageAndText(Data upcomingItem, BuildContext context) {
    return InkWell(
      child: Container(
          width: 240,
          height: 240,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(upcomingItem.shopImages.icon))),
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            color: Color(0xFF0E3311).withOpacity(0.7),
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                upcomingItem.name,
                style: TextStyle(fontSize: 35.0),
                textAlign: TextAlign.center,
              ),
            ),
          )),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    SingleUpcomingItemView(upcomingItem: upcomingItem)));
      },
    );
  }
}
