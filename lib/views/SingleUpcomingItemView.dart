// Single Upcoming Item Screen

import 'package:flutter/material.dart';
import 'package:fortnite_sweaty_gamerz/models/upcoming_items_model.dart';
import 'package:fortnite_sweaty_gamerz/utilities/utilities.dart';

class SingleUpcomingItemViewState extends State<SingleUpcomingItemView> {
  Data upcomingItem;

  SingleUpcomingItemViewState(this.upcomingItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(upcomingItem.name, style: TextStyle(fontFamily: 'RobotoMono')),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 20.0)),
              buildItemImageContainer(),
              const Padding(padding: EdgeInsets.only(top: 5.0)),
              Text('"' + upcomingItem.description + '"',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'RobotoMono')),
              const Padding(padding: EdgeInsets.only(top: 20.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  buildItemRarityAndTypeRow(),
                  Text('Ureleased',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'RobotoMono',
                      )),
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10.0)),
              const Divider(color: Colors.grey, indent: 10.0, endIndent: 10.0),
              const Padding(padding: EdgeInsets.only(top: 40.0)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItemImageContainer() {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      color: Utilities().determineBGColor(upcomingItem.rarity),
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width,
      child: Image.network(upcomingItem.shopImages.featured != ""
          ? upcomingItem.shopImages.featured
          : upcomingItem.shopImages.icon),
    );
  }

  Widget buildItemRarityAndTypeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildRarityText(),
        const Padding(padding: EdgeInsets.only(left: 5.0, right: 5.0)),
        Text(upcomingItem.readableType,
            style: TextStyle(fontSize: 25.0, fontFamily: 'RobotoMono')),
      ],
    );
  }

  Widget buildRarityText() {
    return Container(
      decoration: BoxDecoration(
          color: Utilities().determineBGColor(upcomingItem.rarity),
          borderRadius: BorderRadius.circular(10.0)),
      padding: EdgeInsets.all(9.0),
      child: Text(Utilities().convertRarityText(upcomingItem.rarity),
          style: TextStyle(
              fontSize: 12.0,
              fontFamily: 'RobotoMono',
              fontWeight: FontWeight.bold)),
    );
  }
}

class SingleUpcomingItemView extends StatefulWidget {
  // Declare featuredItem that holds item info
  final Data upcomingItem;

  // Require featuredItem in constructor
  SingleUpcomingItemView({Key key, @required this.upcomingItem})
      : super(key: key);

  @override
  SingleUpcomingItemViewState createState() =>
      SingleUpcomingItemViewState(upcomingItem);
}
