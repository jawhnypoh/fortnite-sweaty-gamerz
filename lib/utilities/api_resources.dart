// API Resources methods
import 'package:dio/dio.dart';
import 'package:fortnite_sweaty_gamerz/models/item_shop_model.dart';
import 'package:fortnite_sweaty_gamerz/models/player_stats_model.dart';
import 'dart:convert';

class ApiResources {
  // Yes this is bad practice, but needed for GitHub Pages deployment
  final String fnbrApiKey = '0409327c-5eb0-4f6b-a418-15627c102c23';

  final String playerStatsURL = "https://fortnite-api.com/v1/stats/br/v2?name=";
  final String itemShopURL = "https://fnbr.co/api/shop";

  var dio = Dio();

  // Get player stats results from fortnite-api
  Future<PlayerStatsModel> getPlayerStatsResults(String playerName) async {
    try {
      final Response response = await dio.get(playerStatsURL + playerName);
      final jsonResult = json.decode(response.toString());

      print(jsonResult);

      return PlayerStatsModel.fromJson(jsonResult);
    } catch (e) {
      print(e);
    }
  }

  // Get item shop stuff from fnbr.co api
  Future<ItemShopModel> getItemShopResults() async {
    try {
      dio.options.headers = {'x-api-key': fnbrApiKey};
      final Response response = await dio.get(itemShopURL);
      final jsonResult = json.decode(response.toString());

      print(jsonResult);

      return ItemShopModel.fromJson(jsonResult);
    } catch (e) {
      print(e);
    }
  }
}
