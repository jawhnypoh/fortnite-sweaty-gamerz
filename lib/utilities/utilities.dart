// Utilities file for commonly used functions

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

  // Determine whether app is being shown on web or mobile
  String getPath(String path) {
    return (kIsWeb ? 'assets/$path' : path);
  }

  RichText buildTextSpan(String key, String value, double fontSize) {
    return RichText(
        text: TextSpan(children: <TextSpan>[
      TextSpan(
          text: key,
          style: TextStyle(
              fontSize: fontSize, fontFamily: 'Fortnite', color: Colors.white)),
      TextSpan(
          text: value,
          style: TextStyle(fontSize: fontSize, color: Colors.white))
    ]));
  }

  Widget buildTwoLayerStats(String key, String value, BuildContext context) {
    return Container(
        child: ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width / 5,
          maxWidth: MediaQuery.of(context).size.width / 5,
          minHeight: 80.0,
          maxHeight: 80.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(key,
                style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'RobotoMono',
                    color: Colors.grey[350])),
            AutoSizeText(value, style: TextStyle(fontSize: 50.0), maxLines: 1)
          ],
        ),
      ),
    ));
  }
}
