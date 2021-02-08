// Player Stats View

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerStatsView extends StatelessWidget {
  final TextEditingController _query = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextField(
          controller: _query,
          decoration: InputDecoration(
            hintText: 'find a sweat...',
            hintStyle: TextStyle(color: Colors.grey, fontFamily: 'RobotoMono'),
          ),
          onSubmitted: (_queryText) {
            if (_queryText.isNotEmpty) {
              // getQueryResults(_queryText);
            }
          },
          style: TextStyle(color: Colors.white),
        ),
      ),
    ));
  }
}
