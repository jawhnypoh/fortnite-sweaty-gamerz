// News ListView Screen

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortnite_sweaty_gamerz/models/all_news_model.dart';
import 'package:fortnite_sweaty_gamerz/utilities/api_resources.dart';
import 'package:fortnite_sweaty_gamerz/utilities/utilities.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(Utilities().getPath('images/br-logo.png'),
            fit: BoxFit.contain, height: 32),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0),
        child: FutureBuilder<List<Motds>>(
          future: ApiResources().getAllNewsResults(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: Column(
                  children: <Widget>[
                    const Padding(padding: EdgeInsets.only(top: 20.0)),
                    Container(
                        child: Center(
                            child: Text(
                      'News',
                      style: TextStyle(fontSize: 45.0),
                    ))),
                    const Padding(padding: EdgeInsets.only(bottom: 10.0)),
                    buildNewsList(snapshot.data),
                    const Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return buildProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Widget buildProgressIndicator() {
    return const Padding(
      padding: EdgeInsets.all(100.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget buildNewsList(List<Motds> allNewsList) {
    return Expanded(
      child: ListView.builder(
        itemCount: allNewsList == null ? 0 : allNewsList.length,
        itemBuilder: (context, idx) {
          return Card(
            elevation: 3.0,
            margin: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(5.0)),
                    child: Image.network(allNewsList[idx].image)),
                const Padding(padding: EdgeInsets.only(bottom: 5.0)),
                Text(
                  allNewsList[idx].tabTitle == null
                      ? allNewsList[idx].title
                      : allNewsList[idx].tabTitle,
                  style: TextStyle(fontSize: 30.0),
                ),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(allNewsList[idx].body,
                        style: TextStyle(
                            fontSize: 17.0, fontFamily: 'RobotoMono')))
              ],
            ),
          );
        },
      ),
    );
  }
}
