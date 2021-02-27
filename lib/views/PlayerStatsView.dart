// Player Stats View

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fortnite_sweaty_gamerz/models/player_stats_model.dart';
import 'package:fortnite_sweaty_gamerz/utilities/api_resources.dart';
import 'package:fortnite_sweaty_gamerz/utilities/utilities.dart';

class PlayerStatsViewState extends State<PlayerStatsView> {
  Future<PlayerStatsModel> playerStatsModel;
  final TextEditingController query = TextEditingController();
  final numberFormatter = NumberFormat('#,###', 'en_US');
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
                      buildPlayerOverallStatsSection(
                          snapshot.data.data.stats.all, context),
                      const Padding(padding: EdgeInsets.only(top: 10.0)),
                      const Divider(color: Colors.grey),
                      const Padding(padding: EdgeInsets.only(top: 30.0)),
                      buildTeamsList(snapshot.data.data.stats.all)
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
        textInputAction: TextInputAction.go,
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
              constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width / 1.5,
                  maxWidth: MediaQuery.of(context).size.width / 1.5),
              child: buildPlayerNameAndTimePlayed(playerData))
        ],
      ),
    );
  }

  Widget buildPlayerNameAndTimePlayed(Data playerData) {
    int timePlayed =
        new Duration(minutes: playerData.stats.all.overall.minutesPlayed)
            .inHours;
    return Container(
      child: Column(
        children: <Widget>[
          AutoSizeText(playerData.account.name,
              style: TextStyle(fontSize: 60.0), maxLines: 1),
          const Padding(padding: EdgeInsets.only(top: 10.0)),
          AutoSizeText('Played ' + timePlayed.toString() + ' hours',
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'RobotoMono',
              ),
              maxLines: 1)
        ],
      ),
    );
  }

  Widget buildPlayerOverallStatsSection(All playerAll, BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          buildPlayerOverallStatsRow1(playerAll, context),
          const Padding(padding: EdgeInsets.only(top: 10.0)),
          buildPlayerOverallStatsRow2(playerAll, context)
        ],
      ),
    );
  }

  Widget buildPlayerOverallStatsRow1(All playerAll, BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Utilities().buildTwoLayerStats(
              'Wins',
              numberFormatter.format(playerAll.overall.wins).toString(),
              context),
          Utilities().buildTwoLayerStats(
              'Win %', playerAll.overall.winRate.toString(), context),
        ],
      ),
    );
  }

  Widget buildPlayerOverallStatsRow2(All playerAll, BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Utilities().buildTwoLayerStats(
              'Kills',
              numberFormatter.format(playerAll.overall.kills).toString(),
              context),
          Utilities().buildTwoLayerStats(
              'K/D', playerAll.overall.kd.toString(), context)
        ],
      ),
    );
  }

  Widget buildTeamsList(All playerAll) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          buildTeamsListItemSolo(
              title: 'Solo', icon: Icons.person, soloStats: playerAll.solo),
          buildTeamsListItemDuos(
              title: 'Duos', icon: Icons.people, duoStats: playerAll.duo),
          buildTeamsListItemTrios(
              title: 'Trios',
              icon: Icons.group_work,
              trioStats: playerAll.trio),
          buildTeamsListItemSquads(
              title: 'Squads',
              icon: Icons.category,
              squadStats: playerAll.squad)
        ],
      ),
    );
  }

  Widget buildTeamsListItemSolo(
      {int idx, String title, IconData icon, Solo soloStats}) {
    return Material(
      color: Colors.transparent,
      child: Theme(
        data: ThemeData(accentColor: Colors.white),
        child: ExpansionTile(
          initiallyExpanded: true,
          leading: Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
          title: Text(title,
              style: TextStyle(
                  fontSize: 30, fontFamily: 'Fortnite', color: Colors.white)),
          subtitle: Text(
            numberFormatter.format(soloStats.matches).toString() + ' Matches',
            style: TextStyle(color: Colors.white),
          ),
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 10.0)),
            buildTeamsDetailIntRows(
                'Wins', 'Kills', soloStats.wins, soloStats.kills),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            buildTeamsDetailDoubleRows(
                'Win %', 'K/D', soloStats.winRate, soloStats.kd),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            buildTeamsDetailIntRows(
                'Top 10', 'Top 25', soloStats.top10, soloStats.top25),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            buildTeamsDetailIntRows('Time Played', 'Score',
                soloStats.minutesPlayed, soloStats.score),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            buildTeamsDetailDoubleRows('Score/Match', 'Score/Min',
                soloStats.scorePerMatch, soloStats.scorePerMin),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            buildTeamsDetailDoubleRows('Kills/Match', 'Kills/Min',
                soloStats.killsPerMatch, soloStats.killsPerMin),
            const Padding(padding: EdgeInsets.only(top: 10.0)),
          ],
        ),
      ),
    );
  }

  Widget buildTeamsListItemDuos(
      {int idx, String title, IconData icon, Duo duoStats}) {
    return Material(
      color: Colors.transparent,
      child: Theme(
        data: ThemeData(accentColor: Colors.white),
        child: ExpansionTile(
          leading: Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
          title: Text(title,
              style: TextStyle(
                  fontSize: 30, fontFamily: 'Fortnite', color: Colors.white)),
          subtitle: Text(
            numberFormatter.format(duoStats.matches).toString() + ' Matches',
            style: TextStyle(color: Colors.white),
          ),
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 10.0)),
            buildTeamsDetailIntRows(
                'Wins', 'Kills', duoStats.wins, duoStats.kills),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            buildTeamsDetailDoubleRows(
                'Win %', 'K/D', duoStats.winRate, duoStats.kd),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            buildTeamsDetailIntRows(
                'Top 5', 'Top 12', duoStats.top5, duoStats.top12),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            buildTeamsDetailIntRows(
                'Time Played', 'Score', duoStats.minutesPlayed, duoStats.score),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            buildTeamsDetailDoubleRows('Score/Match', 'Score/Min',
                duoStats.scorePerMatch, duoStats.scorePerMin),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            buildTeamsDetailDoubleRows('Kills/Match', 'Kills/Min',
                duoStats.killsPerMatch, duoStats.killsPerMin),
            const Padding(padding: EdgeInsets.only(top: 10.0)),
          ],
        ),
      ),
    );
  }

  Widget buildTeamsListItemTrios(
      {int idx, String title, IconData icon, Trio trioStats}) {
    return Material(
      color: Colors.transparent,
      child: Theme(
        data: ThemeData(accentColor: Colors.white),
        child: ExpansionTile(
          leading: Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
          title: Text(title,
              style: TextStyle(
                  fontSize: 30, fontFamily: 'Fortnite', color: Colors.white)),
          subtitle: Text(
            numberFormatter.format(trioStats.matches).toString() + ' Matches',
            style: TextStyle(color: Colors.white),
          ),
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 10.0)),
            buildTeamsDetailIntRows(
                'Wins', 'Kills', trioStats.wins, trioStats.kills),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            buildTeamsDetailDoubleRows(
                'Win %', 'K/D', trioStats.winRate, trioStats.kd),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            buildTeamsDetailIntRows(
                'Top 3', 'Top 6', trioStats.top3, trioStats.top6),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            buildTeamsDetailIntRows('Time Played', 'Score',
                trioStats.minutesPlayed, trioStats.score),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            buildTeamsDetailDoubleRows('Score/Match', 'Score/Min',
                trioStats.scorePerMatch, trioStats.scorePerMin),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            buildTeamsDetailDoubleRows('Kills/Match', 'Kills/Min',
                trioStats.killsPerMatch, trioStats.killsPerMin),
            const Padding(padding: EdgeInsets.only(top: 10.0)),
          ],
        ),
      ),
    );
  }

  Widget buildTeamsListItemSquads(
      {int idx, String title, IconData icon, Squad squadStats}) {
    return Material(
      color: Colors.transparent,
      child: Theme(
        data: ThemeData(accentColor: Colors.white),
        child: ExpansionTile(
          leading: Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
          title: Text(title,
              style: TextStyle(
                  fontSize: 30, fontFamily: 'Fortnite', color: Colors.white)),
          subtitle: Text(
            numberFormatter.format(squadStats.matches).toString() + ' Matches',
            style: TextStyle(color: Colors.white),
          ),
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 10.0)),
            buildTeamsDetailIntRows(
                'Wins', 'Kills', squadStats.wins, squadStats.kills),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            buildTeamsDetailDoubleRows(
                'Win %', 'K/D', squadStats.winRate, squadStats.kd),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            buildTeamsDetailIntRows(
                'Top 3', 'Top 6', squadStats.top3, squadStats.top6),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            buildTeamsDetailIntRows('Time Played', 'Score',
                squadStats.minutesPlayed, squadStats.score),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            buildTeamsDetailDoubleRows('Score/Match', 'Score/Min',
                squadStats.scorePerMatch, squadStats.scorePerMin),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            buildTeamsDetailDoubleRows('Kills/Match', 'Kills/Min',
                squadStats.killsPerMatch, squadStats.killsPerMin),
            const Padding(padding: EdgeInsets.only(top: 10.0)),
          ],
        ),
      ),
    );
  }

  Widget buildTeamsDetailIntRows(
      String firstLabel, String secondLabel, int firstStat, int secondStat) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Utilities().buildTwoLayerStats(firstLabel,
              numberFormatter.format(firstStat).toString(), context),
          Utilities()
              .buildTwoLayerStats(secondLabel, secondStat.toString(), context)
        ],
      ),
    );
  }

  Widget buildTeamsDetailDoubleRows(String firstLabel, String secondLabel,
      double firstStat, double secondStat) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Utilities().buildTwoLayerStats(firstLabel,
              numberFormatter.format(firstStat).toString(), context),
          Utilities()
              .buildTwoLayerStats(secondLabel, secondStat.toString(), context)
        ],
      ),
    );
  }
}

class PlayerStatsView extends StatefulWidget {
  @override
  PlayerStatsViewState createState() => PlayerStatsViewState();
}
