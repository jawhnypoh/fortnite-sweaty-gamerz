// Utilities file for commonly used functions

import 'package:flutter/material.dart';

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
}
