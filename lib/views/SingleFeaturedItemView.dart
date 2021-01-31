// Single Featured Item Screen

import 'package:flutter/material.dart';
import 'package:fortnite_sweaty_gamerz/models/current_items_model.dart';
import 'package:fortnite_sweaty_gamerz/utilities/utilities.dart';

class SingleFeaturedItemViewState extends State<SingleFeaturedItemView> {
  Featured featuredItem;

  SingleFeaturedItemViewState(this.featuredItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(featuredItem.name, style: TextStyle(fontFamily: 'RobotoMono')),
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
              Text('"' + featuredItem.description + '"',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'RobotoMono')),
              const Padding(padding: EdgeInsets.only(top: 20.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  buildItemRarityAndTypeRow(),
                  buildItemPriceText(),
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10.0)),
              const Divider(color: Colors.grey, indent: 10.0, endIndent: 10.0),
              const Padding(padding: EdgeInsets.only(top: 40.0)),
              buildItemTimestamp(),
              const Padding(padding: EdgeInsets.only(bottom: 20.0)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItemImageContainer() {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      color: Utilities().determineBGColor(featuredItem.rarity),
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width,
      child: Image.network(featuredItem.shopImages.featured != ""
          ? featuredItem.shopImages.featured
          : featuredItem.shopImages.icon),
    );
  }

  Widget buildItemRarityAndTypeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildRarityText(),
        const Padding(padding: EdgeInsets.only(left: 5.0, right: 5.0)),
        Text(featuredItem.readableType,
            style: TextStyle(fontSize: 25.0, fontFamily: 'RobotoMono')),
      ],
    );
  }

  Widget buildRarityText() {
    return Container(
      decoration: BoxDecoration(
          color: Utilities().determineBGColor(featuredItem.rarity),
          borderRadius: BorderRadius.circular(10.0)),
      padding: EdgeInsets.all(9.0),
      child: Text(featuredItem.rarity,
          style: TextStyle(fontSize: 20.0, fontFamily: 'RobotoMono')),
    );
  }

  Widget buildItemPriceText() {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          top: 10.0,
        ),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 5.0, right: 2.0),
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                  image: new DecorationImage(
                      image: NetworkImage(featuredItem.priceIconLink))),
            ),
            Text(featuredItem.price, style: TextStyle(fontSize: 30.0))
          ],
        ));
  }

  Widget buildItemTimestamp() {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
            'Released: ' +
                Utilities().convertDateTime(featuredItem.history.firstSeen),
            style: TextStyle(fontSize: 20.0, fontFamily: 'RobotoMono')),
        const Padding(padding: EdgeInsets.only(top: 5.0)),
        Text(
            'Last Seen: ' +
                Utilities().convertDateTime(featuredItem.history.lastSeen),
            style: TextStyle(fontSize: 20.0, fontFamily: 'RobotoMono')),
        const Padding(padding: EdgeInsets.only(top: 5.0)),
        Text('Occurences: ' + featuredItem.history.occurrences.toString(),
            style: TextStyle(fontSize: 20.0, fontFamily: 'RobotoMono')),
      ],
    ));
  }
}

class SingleFeaturedItemView extends StatefulWidget {
  // Declare featuredItem that holds item info
  final Featured featuredItem;

  // Require featuredItem in constructor
  SingleFeaturedItemView({Key key, @required this.featuredItem})
      : super(key: key);

  @override
  SingleFeaturedItemViewState createState() =>
      SingleFeaturedItemViewState(featuredItem);
}
