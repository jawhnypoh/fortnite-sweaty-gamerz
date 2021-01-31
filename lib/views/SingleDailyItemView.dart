// Single Daily Item Screen

import 'package:flutter/material.dart';
import 'package:fortnite_sweaty_gamerz/models/current_items_model.dart';
import 'package:fortnite_sweaty_gamerz/utilities/utilities.dart';

class SingleDailyItemViewState extends State<SingleDailyItemView> {
  Daily dailyItem;

  SingleDailyItemViewState(this.dailyItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dailyItem.name, style: TextStyle(fontFamily: 'RobotoMono')),
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
              Text('"' + dailyItem.description + '"',
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
      color: Utilities().determineBGColor(dailyItem.rarity),
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width,
      child: Image.network(dailyItem.shopImages.featured != ""
          ? dailyItem.shopImages.featured
          : dailyItem.shopImages.icon),
    );
  }

  Widget buildItemRarityAndTypeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildRarityText(),
        const Padding(padding: EdgeInsets.only(left: 5.0, right: 5.0)),
        Text(dailyItem.readableType,
            style: TextStyle(fontSize: 25.0, fontFamily: 'RobotoMono')),
      ],
    );
  }

  Widget buildRarityText() {
    return Container(
      decoration: BoxDecoration(
          color: Utilities().determineBGColor(dailyItem.rarity),
          borderRadius: BorderRadius.circular(10.0)),
      padding: EdgeInsets.all(9.0),
      child: Text(Utilities().convertRarityText(dailyItem.rarity),
          style: TextStyle(
              fontSize: 12.0,
              fontFamily: 'RobotoMono',
              fontWeight: FontWeight.bold)),
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
                      image: NetworkImage(dailyItem.priceIconLink))),
            ),
            Text(dailyItem.price, style: TextStyle(fontSize: 30.0))
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
                Utilities().convertDateTime(dailyItem.history.firstSeen),
            style: TextStyle(fontSize: 20.0, fontFamily: 'RobotoMono')),
        const Padding(padding: EdgeInsets.only(top: 5.0)),
        Text(
            'Last Seen: ' +
                Utilities().convertDateTime(dailyItem.history.lastSeen),
            style: TextStyle(fontSize: 20.0, fontFamily: 'RobotoMono')),
        const Padding(padding: EdgeInsets.only(top: 5.0)),
        Text('Occurences: ' + dailyItem.history.occurrences.toString(),
            style: TextStyle(fontSize: 20.0, fontFamily: 'RobotoMono')),
      ],
    ));
  }
}

class SingleDailyItemView extends StatefulWidget {
  // Declare dailyItem that holds item info
  final Daily dailyItem;

  // Require dailyItem in constructor
  SingleDailyItemView({Key key, @required this.dailyItem}) : super(key: key);

  @override
  SingleDailyItemViewState createState() => SingleDailyItemViewState(dailyItem);
}
