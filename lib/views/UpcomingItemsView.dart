// Upcoming Items Screen

import 'package:flutter/material.dart';

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
    );
  }
}
