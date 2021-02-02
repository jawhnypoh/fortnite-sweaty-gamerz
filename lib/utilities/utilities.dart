// Utilities file for commonly used functions

import 'package:flutter/material.dart';
import 'package:fortnite_sweaty_gamerz/models/all_news_model.dart';
import 'package:jiffy/jiffy.dart';

class Utilities {
  Color determineBGColor(String rarity) {
    switch (rarity) {
      case 'common':
        return Colors.grey;
      case 'uncommon':
        return Colors.green[800];
      case 'rare':
        return Colors.blue[900];
      case 'epic':
        return Colors.deepPurple[800];
      case 'legendary':
        return Colors.orange[400];
      case 'icon_series':
        return Colors.teal[600];
      case 'marvel':
        return Colors.red[900];
      case 'dark':
        return Colors.purple[700];
      case 'shadow':
        return Colors.blueGrey[900];
    }
  }

  String convertRarityText(String rarity) {
    if (rarity == 'icon_series') {
      rarity = 'icon series';
    }
    return rarity.toUpperCase();
  }

  String convertDateTime(String dateTime) {
    return Jiffy(dateTime).format('MMM do, yyyy');
  }

  String convertFullDateTime(String dateTime) {
    return Jiffy(dateTime).format('MMMM do, yyyy');
  }

  List buildNewsList(Data brNews) {}
}
