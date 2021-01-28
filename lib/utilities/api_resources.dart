// API Resources methods
import 'package:dio/dio.dart';
import 'package:fortnite_sweaty_gamerz/models/player_stats_model.dart';
import 'dart:convert';

class ApiResources {
  final String playerStatsURL = "https://fortnite-api.com/v1/stats/br/v2?name=";

  var dio = Dio();

  // Get player stats results from fortnite-api
  Future<PlayerStats> getPlayerStatsResults(String playerName) async {
    try {
      final Response response = await dio.get(playerStatsURL + playerName);
      final jsonResult = json.decode(response.toString());

      print(jsonResult);

      return PlayerStats.fromJson(jsonResult);
    } catch (e) {
      print(e);
    }
  }
}
