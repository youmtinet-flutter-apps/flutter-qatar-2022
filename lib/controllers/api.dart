import 'package:console_tools/console_tools.dart';
import 'package:fifa_worldcup/lib.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class MAtchesAndStandings {
  List<Matche> matches = [];
  List<Standings> standings = [];
  MAtchesAndStandings({required this.matches, required this.standings});
}

var headers = {'X-Auth-Token': token};
Future<MAtchesAndStandings> fifaWCStandingsAndMatches() async {
  WorldcupStandings standings = await fifaWCStandings() ?? WorldcupStandings.fromJson({});
  WorldcupMatches matches = await fifaWCMatches() ?? WorldcupMatches.fromJson({});
  return MAtchesAndStandings(matches: matches.matches, standings: standings.standings);
}

Future<WorldcupStandings?> fifaWCStandings() async {
  if (!kDebugMode) {
    var connect = GetConnect();
    var getGet = await connect.get('https://api.football-data.org/v4/competitions/2000/standings', headers: headers);

    if (getGet.isOk) {
      var fromJson = WorldcupStandings.fromJson(getGet.body);
      return fromJson;
    } else {
      Console.log(getGet.statusText);
    }
  } else {
    return WorldcupStandings.fromJson(testStandings);
  }
  return null;
}

Future<WorldcupMatches?> fifaWCMatches() async {
  if (!kDebugMode) {
    var connect = GetConnect();
    var getGet = await connect.get('https://api.football-data.org/v4/competitions/2000/matches', headers: headers);

    if (getGet.isOk) {
      var fromJson = WorldcupMatches.fromJson(getGet.body);
      return fromJson;
    } else {
      Console.log(getGet.statusText);
    }
  } else {
    var fromJson = WorldcupMatches.fromJson(testMatches);
    return fromJson;
  }
  return null;
}
