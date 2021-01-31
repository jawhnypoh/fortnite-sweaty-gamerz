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
              Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                color: Utilities().determineBGColor(featuredItem.rarity),
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                child: Image.network(featuredItem.shopImages.icon),
              ),
              const Padding(padding: EdgeInsets.only(top: 5.0)),
              Text('"' + featuredItem.description + '"',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'RobotoMono')),
              const Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildRarityText(),
                  const Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0)),
                  Text(featuredItem.type,
                      style:
                          TextStyle(fontSize: 25.0, fontFamily: 'RobotoMono')),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 40.0)),
              Text(
                  'Released: ' +
                      Utilities()
                          .convertDateTime(featuredItem.history.firstSeen),
                  style: TextStyle(fontSize: 20.0, fontFamily: 'RobotoMono')),
              Text(
                  'Last Seen: ' +
                      Utilities()
                          .convertDateTime(featuredItem.history.lastSeen),
                  style: TextStyle(fontSize: 20.0, fontFamily: 'RobotoMono')),
              Text('Occurences: ' + featuredItem.history.occurrences.toString(),
                  style: TextStyle(fontSize: 20.0, fontFamily: 'RobotoMono')),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRarityText() {
    return Container(
      decoration: BoxDecoration(
          color: Utilities().determineBGColor(featuredItem.rarity),
          borderRadius: BorderRadius.circular(10.0)),
      padding: EdgeInsets.all(8.0),
      child: Text(featuredItem.rarity,
          style: TextStyle(fontSize: 25.0, fontFamily: 'RobotoMono')),
    );
  }
}

class SingleFeaturedItemView extends StatefulWidget {
  // Declare itemInfo that holds item info
  final Featured featuredItem;

  // Require ItemInfo in constructor
  SingleFeaturedItemView({Key key, @required this.featuredItem})
      : super(key: key);

  @override
  SingleFeaturedItemViewState createState() =>
      SingleFeaturedItemViewState(featuredItem);
}
