// Item Shop Screen

import 'package:flutter/material.dart';
import 'package:fortnite_sweaty_gamerz/models/item_shop_model.dart';
import 'package:fortnite_sweaty_gamerz/utilities/api_resources.dart';
import 'package:intl/intl.dart';

class ItemShopView extends StatelessWidget {
  const ItemShopView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Image.asset('images/br-logo.png', fit: BoxFit.contain, height: 32),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: FutureBuilder<ItemShopModel>(
            future: ApiResources().getItemShopResults(),
            builder: (context, snapshot) {
              return Container(
                child: Column(
                  children: <Widget>[
                    const Padding(padding: EdgeInsets.only(top: 20.0)),
                    buildDateTime(),
                    const Padding(padding: EdgeInsets.only(bottom: 20.0)),
                  ],
                ),
              );
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
}
