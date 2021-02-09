// API Resources methods
import 'package:dio/dio.dart';
import 'package:fortnite_sweaty_gamerz/models/all_news_model.dart';
import 'package:fortnite_sweaty_gamerz/models/current_items_model.dart';
import 'package:fortnite_sweaty_gamerz/models/player_stats_model.dart';
import 'dart:convert';
import 'package:fortnite_sweaty_gamerz/models/upcoming_items_model.dart';

class ApiResources {
  // Yes this is bad practice, but needed for GitHub Pages deployment
  final String fnbrApiKey = '0409327c-5eb0-4f6b-a418-15627c102c23';

  final String playerStatsURL = "https://fortnite-api.com/v1/stats/br/v2?name=";
  final String currentItemShopURL = "https://fnbr.co/api/shop";
  final String upcomingItemShopURL = "https://fnbr.co/api/upcoming";
  final String fortniteNewsURL = "https://fortnite-api.com/v2/news";

  var dio = Dio();

  // Get player stats results from fortnite-api
  Future<PlayerStatsModel> getPlayerStatsResults(String playerName) async {
    Map<String, dynamic> jsonResult;
    try {
      final Response response = await dio.get(playerStatsURL + playerName);
      jsonResult = json.decode(response.toString());

      print(jsonResult);

      return PlayerStatsModel.fromJson(jsonResult);
    } catch (e) {
      if (e is DioError) {
        return PlayerStatsModel.fromJson(jsonResult);
      }
      print(e);
    }
  }

  // Get item current shop stuff from fnbr.co api
  Future<CurrentItemsModel> getCurrentItemShopResults() async {
    try {
      dio.options.headers = {'x-api-key': fnbrApiKey};
      final Response response = await dio.get(currentItemShopURL);
      final jsonResult = json.decode(response.toString());

      print(jsonResult);

      return CurrentItemsModel.fromJson(jsonResult);
    } catch (e) {
      print(e);
    }
  }

  // Get upcoming item shop stuff from fnbr.co api
  Future<UpcomingItemsModel> getUpcomingItemShopResults() async {
    try {
      dio.options.headers = {'x-api-key': fnbrApiKey};
      final Response response = await dio.get(upcomingItemShopURL);
      final jsonResult = json.decode(response.toString());

      print(jsonResult);

      return UpcomingItemsModel.fromJson(jsonResult);
    } catch (e) {
      print(e);
    }
  }

  // Get all Fortnite related news from fortnite-api
  Future<List<Motds>> getAllNewsResults() async {
    try {
      List<Motds> newsList = [];

      final Response response = await dio.get(fortniteNewsURL);
      final jsonResult = json.decode(response.toString());

      print(jsonResult);

      AllNewsModel allNewsModel = AllNewsModel.fromJson(jsonResult);

      if (allNewsModel.data.br.motds != null &&
          allNewsModel.data.creative.motds != null) {
        for (Motds motds in allNewsModel.data.br.motds) {
          newsList.add(motds);
        }

        // for (Messages messages in allNewsModel.data.stw.messages) {
        //   newsList.add(messages);
        // }

        for (Motds motds in allNewsModel.data.creative.motds) {
          newsList.add(motds);
        }
      }
      return newsList;
    } catch (e) {
      print(e);
    }
  }
}
