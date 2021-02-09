// Player Stats View

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortnite_sweaty_gamerz/models/player_stats_model.dart';
import 'package:fortnite_sweaty_gamerz/utilities/api_resources.dart';
import 'package:fortnite_sweaty_gamerz/utilities/utilities.dart';

class PlayerStatsViewState extends State<PlayerStatsView> {
  Future<PlayerStatsModel> playerStatsModel;
  final TextEditingController query = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  PlayerStatsViewState();

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: buildAppBar(),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: FutureBuilder<PlayerStatsModel>(
            future: playerStatsModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: Column(
                    children: <Widget>[
                      const Padding(padding: EdgeInsets.only(top: 20.0)),
                      buildPlayerIconAndNameRow(snapshot.data.data),
                      const Divider(color: Colors.grey),
                      const Padding(padding: EdgeInsets.only(top: 30.0)),
                      buildPlayerOverallStatsRow(
                          snapshot.data.data.stats.all, context)
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return buildPlayerNotFound();
              } else {
                return isLoading ? buildProgressIndicator() : Container();
              }
            },
          ),
        ),
      ),
    ));
  }

  Widget buildProgressIndicator() {
    return const Padding(
      padding: EdgeInsets.all(100.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget buildPlayerNotFound() {
    return Container(
        child: Padding(
            padding: EdgeInsets.all(100.0),
            child: Center(
                child: Column(
              children: <Widget>[
                Image.asset(
                  Utilities().getPath('images/llama.png'),
                  height: 280.0,
                  width: 250.0,
                  fit: BoxFit.fill,
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20.0)),
                Text(
                  'Oh no! Anyways...',
                  style: TextStyle(fontSize: 40.0),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 5.0)),
                Text(
                    'Could not find a player with that name. Are you sure you spelled it right?',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'RobotoMono',
                        color: Colors.grey[350])),
              ],
            ))));
  }

  Widget buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: TextField(
        controller: query,
        decoration: InputDecoration(
          hintText: 'find a sweat...',
          hintStyle: TextStyle(color: Colors.grey, fontFamily: 'RobotoMono'),
        ),
        onSubmitted: (queryText) {
          if (queryText.isNotEmpty) {
            setState(() {
              isLoading = true;
              playerStatsModel =
                  ApiResources().getPlayerStatsResults(queryText);
            });
          }
        },
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget buildPlayerIconAndNameRow(Data playerData) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image.asset(Utilities().getPath('images/user.png')),
          ConstrainedBox(
            constraints: const BoxConstraints(
                minWidth: 300.0,
                maxWidth: 300.0,
                minHeight: 80.0,
                maxHeight: 80.0),
            child: AutoSizeText(playerData.account.name,
                style: TextStyle(fontSize: 60.0), maxLines: 1),
          )
          // Utilities().buildTextSpan('Name: ', playerData.account.name, 35.0)
        ],
      ),
    );
  }

  Widget buildPlayerOverallStatsRow(All playerAll, BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Utilities().buildTwoLayerStats(
              'Wins:', playerAll.overall.wins.toString(), context),
          Utilities().buildTwoLayerStats(
              'Win %:', playerAll.overall.winRate.toString(), context),
          Utilities().buildTwoLayerStats(
              'Kills:', playerAll.overall.kills.toString(), context),
          Utilities().buildTwoLayerStats(
              'K/D:', playerAll.overall.kd.toString(), context)
        ],
      ),
    );
  }
}

class PlayerStatsView extends StatefulWidget {
  @override
  PlayerStatsViewState createState() => PlayerStatsViewState();
}
