import 'dart:convert';

import 'package:console_tools/console_tools.dart';
import 'package:fifa_worldcup/lib.dart';
import 'package:http/http.dart';

Future<WorldcupStandings?> fifaWCStandings() async {
  var headers = {'X-Auth-Token': token};
  var request = Request('GET', Uri.parse('https://api.football-data.org/v4/competitions/2000/standings'));

  request.headers.addAll(headers);

  StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var text = await response.stream.bytesToString();
    var fromJson = WorldcupStandings.fromJson(json.decode(text));
    return fromJson;
  } else {
    Console.log(response.reasonPhrase);
  }
  return null;
}

Future<WorldcupMatches?> fifaWCMatches() async {
  var headers = {'X-Auth-Token': token};
  var request = Request('GET', Uri.parse('https://api.football-data.org/v4/competitions/2000/matches'));

  request.headers.addAll(headers);

  StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var text = await response.stream.bytesToString();
    var fromJson = WorldcupMatches.fromJson(json.decode(text));
    return fromJson;
  } else {
    Console.log(response.reasonPhrase);
  }
  return null;
}
