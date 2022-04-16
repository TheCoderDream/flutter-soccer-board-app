import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:http/http.dart';
import '../models/index.dart';

class SoccerApi {
  int currentSeason = 2021;
  int league = 39;


  String get apiUrl {
    return "https://api-football-v1.p.rapidapi.com/v3/fixtures?season=$currentSeason&league=$league";
  }

  static const headers = {
    'X-RapidAPI-Host': 'api-football-v1.p.rapidapi.com',
    'X-RapidAPI-Key': 'TYPE YOUR API'
  };

  Future<List<SoccerMatch>> getAllMatches() async {
    Response res = await get(Uri.parse(apiUrl), headers: headers);

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'];
      List<SoccerMatch> matches = matchesList.getRange(0, 10).map((dynamic item) => SoccerMatch.fromJson(item)).toList();
      return matches;
    }
    throw Error();
  }


  Future<List<SoccerMatch>> getAllMatchesFromMockData() async {
    var body = jsonDecode(await readJson());
    List<dynamic> matchesList = body['response'];
    List<SoccerMatch> matches = matchesList.getRange(0, 20).map((dynamic item) => SoccerMatch.fromJson(item)).toList();
    return matches;
  }

  Future<String> readJson() async {
    return await rootBundle.loadString('assets/mock/soccer_app.json');
  }
}