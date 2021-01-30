// Upcoming Items Screen

import 'package:flutter/material.dart';
import 'package:fortnite_sweaty_gamerz/models/upcoming_items_model.dart';
import 'package:fortnite_sweaty_gamerz/utilities/api_resources.dart';

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
                return Container();
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
}
