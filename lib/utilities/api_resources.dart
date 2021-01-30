// API Resources methods
import 'package:dio/dio.dart';
import 'package:fortnite_sweaty_gamerz/models/item_shop_model.dart';
import 'package:fortnite_sweaty_gamerz/models/player_stats_model.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

class ApiResources {
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
      await DotEnv.load();
      dio.options.headers = {'x-api-key': DotEnv.env['FNBR_API_KEY']};
      final Response response = await dio.get(itemShopURL);
      final jsonResult = json.decode(response.toString());

      print(jsonResult);

      return ItemShopModel.fromJson(jsonResult);
    } catch (e) {
      print(e);
    }
  }
}
