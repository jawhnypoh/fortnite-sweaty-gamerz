// Item Shop Screen

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fortnite_sweaty_gamerz/views/CurrentItemsView.dart';

class ItemShopView extends StatefulWidget {
  @override
  ItemShopViewState createState() => ItemShopViewState();
}

class ItemShopViewState extends State<ItemShopView>
    with TickerProviderStateMixin {
  final List<Widget> screens = [
    const CurrentItemsView(key: PageStorageKey('Current'))
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  int selectedIndex = 0;

  static const TextStyle optionsStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: screens[selectedIndex],
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.calendar), label: 'Current'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.newspaper), label: 'Upcoming')
        ],
      ),
    );
  }
}
