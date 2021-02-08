import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:fortnite_sweaty_gamerz/models/player_stats_model.dart';
import 'package:fortnite_sweaty_gamerz/utilities/api_resources.dart';
import 'package:fortnite_sweaty_gamerz/utilities/utilities.dart';
import 'package:fortnite_sweaty_gamerz/views/ItemShopView.dart';
import 'package:fortnite_sweaty_gamerz/views/NewsListView.dart';
import 'package:fortnite_sweaty_gamerz/views/PlayerStatsView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fortnite Sweaty Gamerz',
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Fortnite'),
      home: MyHomePage(title: 'Fortnite Sweaty Gamerz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String get playerName => null;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(Utilities().getPath('images/br-logo.png'),
            fit: BoxFit.contain, height: 32),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(top: 20.0)),
                playerButton(context),
                const Padding(padding: EdgeInsets.only(top: 40.0)),
                itemShopButton(context),
                const Padding(padding: EdgeInsets.only(top: 40.0)),
                newsButton(context),
                const Padding(padding: EdgeInsets.only(bottom: 10.0)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<List<PlayerStats>> searchResult(String playerName) async {
  //   return List.generate(playerName.length, (int idx) {
  //     return ApiResources().getPlayerStatsResults(playerName);
  //   });
  // }

  Widget playerButton(BuildContext context) {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(height: 340.0),
        child: FlatButton(
            height: 300.0,
            minWidth: MediaQuery.of(context).size.width - 100.0,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PlayerStatsView()));
            },
            padding: EdgeInsets.all(0.0),
            child: Column(children: <Widget>[
              Image.asset(Utilities().getPath('images/players.jpg'),
                  height: 275, width: 550, fit: BoxFit.fitWidth),
              const Padding(padding: EdgeInsets.only(bottom: 10.0)),
              Text('FIND A SWEAT', style: TextStyle(fontSize: 40.0)),
            ])),
      ),
    );
  }

  Widget itemShopButton(BuildContext context) {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(height: 340.0),
        child: FlatButton(
            height: 300.0,
            minWidth: MediaQuery.of(context).size.width - 100.0,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ItemShopView()));
            },
            padding: EdgeInsets.all(0.0),
            child: Column(children: <Widget>[
              Image.asset(Utilities().getPath('images/store.jpg'),
                  height: 275, width: 550, fit: BoxFit.fitWidth),
              const Padding(padding: EdgeInsets.only(bottom: 10.0)),
              Text('ITEM SHOP', style: TextStyle(fontSize: 40.0)),
            ])),
      ),
    );
  }

  Widget newsButton(BuildContext context) {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(height: 340.0),
        child: FlatButton(
            height: 300.0,
            minWidth: MediaQuery.of(context).size.width - 100.0,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewsListView()));
            },
            padding: EdgeInsets.all(0.0),
            child: Column(children: <Widget>[
              Image.asset(Utilities().getPath('images/news.jpg'),
                  height: 275, width: 550, fit: BoxFit.fitWidth),
              const Padding(padding: EdgeInsets.only(bottom: 10.0)),
              Text('NEWS', style: TextStyle(fontSize: 40.0)),
            ])),
      ),
    );
  }

  Widget searchBar(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SearchBar(),
      ),
    ));
  }
}
