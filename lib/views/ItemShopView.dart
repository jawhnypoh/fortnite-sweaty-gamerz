// Item Shop Screen

import 'package:flutter/material.dart';

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
    );
  }
}
