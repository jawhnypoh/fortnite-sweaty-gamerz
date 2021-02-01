// News ListView Screen

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortnite_sweaty_gamerz/models/all_news_model.dart';
import 'package:fortnite_sweaty_gamerz/utilities/api_resources.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Image.asset('images/br-logo.png', fit: BoxFit.contain, height: 32),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0),
        child: FutureBuilder<AllNewsModel>(
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
                    const Padding(padding: EdgeInsets.only(bottom: 20.0)),
                    buildNewsList(snapshot.data.data)
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

  Widget buildNewsList(Data allNews) {}
}
