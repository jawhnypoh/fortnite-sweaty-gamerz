// Single Featured Item Screen

import 'package:flutter/material.dart';
import 'package:fortnite_sweaty_gamerz/models/current_items_model.dart';

class SingleFeaturedItemViewState extends State<SingleFeaturedItemView> {
  Featured featuredItem;

  SingleFeaturedItemViewState(this.featuredItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(featuredItem.name),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3,
                child: Image.network(featuredItem.shopImages.icon),
              )
            ],
          ),
        ),
      ),
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
