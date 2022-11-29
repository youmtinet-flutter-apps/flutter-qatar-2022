class WorldcupMatches {
  final Filters filters;
  final ResultSet resultSet;
  final Competition competition;
  final List<Matches> matches;
  const WorldcupMatches({
    required this.filters,
    required this.resultSet,
    required this.competition,
    required this.matches,
  });
  WorldcupMatches copyWith({Filters? filters, ResultSet? resultSet, Competition? competition, List<Matches>? matches}) {
    return WorldcupMatches(
      filters: filters ?? this.filters,
      resultSet: resultSet ?? this.resultSet,
      competition: competition ?? this.competition,
      matches: matches ?? this.matches,
    );
  }

  Map<String, Object?> toJson() {
    return {'filters': filters.toJson(), 'resultSet': resultSet.toJson(), 'competition': competition.toJson(), 'matches': matches.map<Map<String, dynamic>>((data) => data.toJson()).toList()};
  }

  static WorldcupMatches fromJson(Map<String, Object?> json) {
    return WorldcupMatches(
        filters: json['filters'] == null ? Filters.fromJson({}) : Filters.fromJson(json['filters'] as Map<String, Object?>),
        resultSet: json['resultSet'] == null ? ResultSet.fromJson({}) : ResultSet.fromJson(json['resultSet'] as Map<String, Object?>),
        competition: json['competition'] == null ? Competition.fromJson({}) : Competition.fromJson(json['competition'] as Map<String, Object?>),
        matches: json['matches'] == null ? [] : (json['matches'] as List).map<Matches>((data) => Matches.fromJson(data as Map<String, Object?>)).toList());
  }

  @override
  String toString() {
    return 'WorldcupMatches(filters:${filters.toString()},resultSet:${resultSet.toString()},competition:${competition.toString()},matches:${matches.toString()})';
  }

  @override
  bool operator ==(Object other) {
    return other is WorldcupMatches && other.runtimeType == runtimeType && other.filters == filters && other.resultSet == resultSet && other.competition == competition && other.matches == matches;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, filters, resultSet, competition, matches);
  }
}

class Matches {
  final Area area;
  final Competition competition;
  final Season season;
  final int id;
  final String utcDate;
  final String status;
  final int matchday;
  final String stage;
  final String group;
  final String lastUpdated;
  final HomeTeam homeTeam;
  final HomeTeam awayTeam;
  final Score score;
  final Odds odds;
  final List<Referees> referees;
  const Matches({
    required this.area,
    required this.competition,
    required this.season,
    required this.id,
    required this.utcDate,
    required this.status,
    required this.matchday,
    required this.stage,
    required this.group,
    required this.lastUpdated,
    required this.homeTeam,
    required this.awayTeam,
    required this.score,
    required this.odds,
    required this.referees,
  });
  Matches copyWith({Area? area, Competition? competition, Season? season, int? id, String? utcDate, String? status, int? matchday, String? stage, String? group, String? lastUpdated, HomeTeam? homeTeam, HomeTeam? awayTeam, Score? score, Odds? odds, List<Referees>? referees}) {
    return Matches(
        area: area ?? this.area,
        competition: competition ?? this.competition,
        season: season ?? this.season,
        id: id ?? this.id,
        utcDate: utcDate ?? this.utcDate,
        status: status ?? this.status,
        matchday: matchday ?? this.matchday,
        stage: stage ?? this.stage,
        group: group ?? this.group,
        lastUpdated: lastUpdated ?? this.lastUpdated,
        homeTeam: homeTeam ?? this.homeTeam,
        awayTeam: awayTeam ?? this.awayTeam,
        score: score ?? this.score,
        odds: odds ?? this.odds,
        referees: referees ?? this.referees);
  }

  Map<String, Object?> toJson() {
    return {
      'area': area.toJson(),
      'competition': competition.toJson(),
      'season': season.toJson(),
      'id': id,
      'utcDate': utcDate,
      'status': status,
      'matchday': matchday,
      'stage': stage,
      'group': group,
      'lastUpdated': lastUpdated,
      'homeTeam': homeTeam.toJson(),
      'awayTeam': awayTeam.toJson(),
      'score': score.toJson(),
      'odds': odds.toJson(),
      'referees': referees.map<Map<String, dynamic>>((data) => data.toJson()).toList()
    };
  }

  static Matches fromJson(Map<String, Object?> json) {
    return Matches(
        area: json['area'] == null ? Area.fromJson({}) : Area.fromJson(json['area'] as Map<String, Object?>),
        competition: json['competition'] == null ? Competition.fromJson({}) : Competition.fromJson(json['competition'] as Map<String, Object?>),
        season: json['season'] == null ? Season.fromJson({}) : Season.fromJson(json['season'] as Map<String, Object?>),
        id: json['id'] == null ? 0 : json['id'] as int,
        utcDate: json['utcDate'] == null ? '' : json['utcDate'] as String,
        status: json['status'] == null ? '' : json['status'] as String,
        matchday: json['matchday'] == null ? 0 : json['matchday'] as int,
        stage: json['stage'] == null ? '' : json['stage'] as String,
        group: json['group'] == null ? '' : json['group'] as String,
        lastUpdated: json['lastUpdated'] == null ? '' : json['lastUpdated'] as String,
        homeTeam: json['homeTeam'] == null ? HomeTeam.fromJson({}) : HomeTeam.fromJson(json['homeTeam'] as Map<String, Object?>),
        awayTeam: json['awayTeam'] == null ? HomeTeam.fromJson({}) : HomeTeam.fromJson(json['awayTeam'] as Map<String, Object?>),
        score: json['score'] == null ? Score.fromJson({}) : Score.fromJson(json['score'] as Map<String, Object?>),
        odds: json['odds'] == null ? Odds.fromJson({}) : Odds.fromJson(json['odds'] as Map<String, Object?>),
        referees: json['referees'] == null ? [] : (json['referees'] as List).map<Referees>((data) => Referees.fromJson(data as Map<String, Object?>)).toList());
  }

  @override
  String toString() {
    return 'Matches(area:${area.toString()},competition:${competition.toString()},season:${season.toString()},id:$id,utcDate:$utcDate,status:$status,matchday:$matchday,stage:$stage,group:$group,lastUpdated:$lastUpdated,homeTeam:${homeTeam.toString()},awayTeam:${awayTeam.toString()},score:${score.toString()},odds:${odds.toString()},referees:${referees.toString()})';
  }

  @override
  bool operator ==(Object other) {
    return other is Matches &&
        other.runtimeType == runtimeType &&
        other.area == area &&
        other.competition == competition &&
        other.season == season &&
        other.id == id &&
        other.utcDate == utcDate &&
        other.status == status &&
        other.matchday == matchday &&
        other.stage == stage &&
        other.group == group &&
        other.lastUpdated == lastUpdated &&
        other.homeTeam == homeTeam &&
        other.awayTeam == awayTeam &&
        other.score == score &&
        other.odds == odds &&
        other.referees == referees;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, area, competition, season, id, utcDate, status, matchday, stage, group, lastUpdated, homeTeam, awayTeam, score, odds, referees);
  }
}

class Referees {
  final int id;
  final String name;
  final String type;
  final String nationality;
  const Referees({
    required this.id,
    required this.name,
    required this.type,
    required this.nationality,
  });
  Referees copyWith({int? id, String? name, String? type, String? nationality}) {
    return Referees(id: id ?? this.id, name: name ?? this.name, type: type ?? this.type, nationality: nationality ?? this.nationality);
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'name': name, 'type': type, 'nationality': nationality};
  }

  static Referees fromJson(Map<String, Object?> json) {
    return Referees(
      id: json['id'] == null ? 0 : json['id'] as int,
      name: json['name'] == null ? '' : json['name'] as String,
      type: json['type'] == null ? '' : json['type'] as String,
      nationality: json['nationality'] == null ? '' : json['nationality'] as String,
    );
  }

  @override
  String toString() {
    return 'Referees(id:$id,name:$name,type:$type,nationality:$nationality)';
  }

  @override
  bool operator ==(Object other) {
    return other is Referees && other.runtimeType == runtimeType && other.id == id && other.name == name && other.type == type && other.nationality == nationality;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, type, nationality);
  }
}

class Odds {
  final String msg;
  const Odds({required this.msg});
  Odds copyWith({String? msg}) {
    return Odds(msg: msg ?? this.msg);
  }

  Map<String, Object?> toJson() {
    return {'msg': msg};
  }

  static Odds fromJson(Map<String, Object?> json) {
    return Odds(msg: json['msg'] == null ? '' : json['msg'] as String);
  }

  @override
  String toString() {
    return 'Odds(msg:$msg)';
  }

  @override
  bool operator ==(Object other) {
    return other is Odds && other.runtimeType == runtimeType && other.msg == msg;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, msg);
  }
}

class Score {
  final String winner;
  final String duration;
  final FullTime fullTime;
  final FullTime halfTime;
  const Score({required this.winner, required this.duration, required this.fullTime, required this.halfTime});
  Score copyWith({String? winner, String? duration, FullTime? fullTime, FullTime? halfTime}) {
    return Score(winner: winner ?? this.winner, duration: duration ?? this.duration, fullTime: fullTime ?? this.fullTime, halfTime: halfTime ?? this.halfTime);
  }

  Map<String, Object?> toJson() {
    return {'winner': winner, 'duration': duration, 'fullTime': fullTime.toJson(), 'halfTime': halfTime.toJson()};
  }

  static Score fromJson(Map<String, Object?> json) {
    return Score(
      winner: json['winner'] == null ? '' : json['winner'] as String,
      duration: json['duration'] == null ? '' : json['duration'] as String,
      fullTime: json['fullTime'] == null ? FullTime.fromJson({}) : FullTime.fromJson(json['fullTime'] as Map<String, Object?>),
      halfTime: json['halfTime'] == null ? FullTime.fromJson({}) : FullTime.fromJson(json['halfTime'] as Map<String, Object?>),
    );
  }

  @override
  String toString() {
    return 'Score(winner:$winner,duration:$duration,fullTime:${fullTime.toString()},halfTime:${halfTime.toString()})';
  }

  @override
  bool operator ==(Object other) {
    return other is Score && other.runtimeType == runtimeType && other.winner == winner && other.duration == duration && other.fullTime == fullTime && other.halfTime == halfTime;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, winner, duration, fullTime, halfTime);
  }
}

class FullTime {
  final int home;
  final int away;
  const FullTime({required this.home, required this.away});
  FullTime copyWith({int? home, int? away}) {
    return FullTime(home: home ?? this.home, away: away ?? this.away);
  }

  Map<String, Object?> toJson() {
    return {'home': home, 'away': away};
  }

  static FullTime fromJson(Map<String, Object?> json) {
    return FullTime(
      home: json['home'] == null ? 0 : json['home'] as int,
      away: json['away'] == null ? 1 : json['away'] as int,
    );
  }

  @override
  String toString() {
    return 'FullTime(home:$home,away:$away)';
  }

  @override
  bool operator ==(Object other) {
    return other is FullTime && other.runtimeType == runtimeType && other.home == home && other.away == away;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, home, away);
  }
}

class HomeTeam {
  final int id;
  final String name;
  final String shortName;
  final String tla;
  final String crest;
  const HomeTeam({
    required this.id,
    required this.name,
    required this.shortName,
    required this.tla,
    required this.crest,
  });
  HomeTeam copyWith({int? id, String? name, String? shortName, String? tla, String? crest}) {
    return HomeTeam(id: id ?? this.id, name: name ?? this.name, shortName: shortName ?? this.shortName, tla: tla ?? this.tla, crest: crest ?? this.crest);
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'name': name, 'shortName': shortName, 'tla': tla, 'crest': crest};
  }

  static HomeTeam fromJson(Map<String, Object?> json) {
    return HomeTeam(
      id: json['id'] == null ? 0 : json['id'] as int,
      name: json['name'] == null ? '' : json['name'] as String,
      shortName: json['shortName'] == null ? '' : json['shortName'] as String,
      tla: json['tla'] == null ? '' : json['tla'] as String,
      crest: json['crest'] == null ? '' : json['crest'] as String,
    );
  }

  @override
  String toString() {
    return 'HomeTeam(id:$id,name:$name,shortName:$shortName,tla:$tla,crest:$crest)';
  }

  @override
  bool operator ==(Object other) {
    return other is HomeTeam && other.runtimeType == runtimeType && other.id == id && other.name == name && other.shortName == shortName && other.tla == tla && other.crest == crest;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, shortName, tla, crest);
  }
}

class Season {
  final int id;
  final String startDate;
  final String endDate;
  final int currentMatchday;
  final dynamic winner;
  const Season({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.currentMatchday,
    required this.winner,
  });
  Season copyWith({int? id, String? startDate, String? endDate, int? currentMatchday, dynamic winner}) {
    return Season(
      id: id ?? this.id,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      currentMatchday: currentMatchday ?? this.currentMatchday,
      winner: winner ?? this.winner,
    );
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'startDate': startDate, 'endDate': endDate, 'currentMatchday': currentMatchday, 'winner': winner};
  }

  static Season fromJson(Map<String, Object?> json) {
    return Season(id: json['id'] == null ? 0 : json['id'] as int, startDate: json['startDate'] == null ? '' : json['startDate'] as String, endDate: json['endDate'] == null ? '' : json['endDate'] as String, currentMatchday: json['currentMatchday'] == null ? 1 : json['currentMatchday'] as int, winner: json['winner'] as dynamic);
  }

  @override
  String toString() {
    return 'Season(id:$id,startDate:$startDate,endDate:$endDate,currentMatchday:$currentMatchday,winner:$winner)';
  }

  @override
  bool operator ==(Object other) {
    return other is Season && other.runtimeType == runtimeType && other.id == id && other.startDate == startDate && other.endDate == endDate && other.currentMatchday == currentMatchday && other.winner == winner;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, startDate, endDate, currentMatchday, winner);
  }
}

class Area {
  final int id;
  final String name;
  final String code;
  final dynamic flag;
  const Area({
    required this.id,
    required this.name,
    required this.code,
    required this.flag,
  });
  Area copyWith({int? id, String? name, String? code, dynamic flag}) {
    return Area(id: id ?? this.id, name: name ?? this.name, code: code ?? this.code, flag: flag ?? this.flag);
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'name': name, 'code': code, 'flag': flag};
  }

  static Area fromJson(Map<String, Object?> json) {
    return Area(
      id: json['id'] == null ? 0 : json['id'] as int,
      name: json['name'] == null ? '' : json['name'] as String,
      code: json['code'] == null ? '' : json['code'] as String,
      flag: json['flag'] as dynamic,
    );
  }

  @override
  String toString() {
    return 'Area(id:$id,name:$name,code:$code,flag:$flag)';
  }

  @override
  bool operator ==(Object other) {
    return other is Area && other.runtimeType == runtimeType && other.id == id && other.name == name && other.code == code && other.flag == flag;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, code, flag);
  }
}

class Competition {
  final int id;
  final String name;
  final String code;
  final String type;
  final String emblem;
  const Competition({
    required this.id,
    required this.name,
    required this.code,
    required this.type,
    required this.emblem,
  });
  Competition copyWith({int? id, String? name, String? code, String? type, String? emblem}) {
    return Competition(id: id ?? this.id, name: name ?? this.name, code: code ?? this.code, type: type ?? this.type, emblem: emblem ?? this.emblem);
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'name': name, 'code': code, 'type': type, 'emblem': emblem};
  }

  static Competition fromJson(Map<String, Object?> json) {
    return Competition(
      id: json['id'] == null ? 0 : json['id'] as int,
      name: json['name'] == null ? '' : json['name'] as String,
      code: json['code'] == null ? '' : json['code'] as String,
      type: json['type'] == null ? '' : json['type'] as String,
      emblem: json['emblem'] == null ? '' : json['emblem'] as String,
    );
  }

  @override
  String toString() {
    return 'Competition(id:$id,name:$name,code:$code,type:$type,emblem:$emblem)';
  }

  @override
  bool operator ==(Object other) {
    return other is Competition && other.runtimeType == runtimeType && other.id == id && other.name == name && other.code == code && other.type == type && other.emblem == emblem;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, code, type, emblem);
  }
}

class ResultSet {
  final int count;
  final String first;
  final String last;
  final int played;
  const ResultSet({
    required this.count,
    required this.first,
    required this.last,
    required this.played,
  });
  ResultSet copyWith({int? count, String? first, String? last, int? played}) {
    return ResultSet(count: count ?? this.count, first: first ?? this.first, last: last ?? this.last, played: played ?? this.played);
  }

  Map<String, Object?> toJson() {
    return {'count': count, 'first': first, 'last': last, 'played': played};
  }

  static ResultSet fromJson(Map<String, Object?> json) {
    return ResultSet(count: json['count'] == null ? 0 : json['count'] as int, first: json['first'] == null ? '' : json['first'] as String, last: json['last'] == null ? '' : json['last'] as String, played: json['played'] == null ? 1 : json['played'] as int);
  }

  @override
  String toString() {
    return 'ResultSet(count:$count,first:$first,last:$last,played:$played)';
  }

  @override
  bool operator ==(Object other) {
    return other is ResultSet && other.runtimeType == runtimeType && other.count == count && other.first == first && other.last == last && other.played == played;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, count, first, last, played);
  }
}

class Filters {
  final String season;
  const Filters({required this.season});
  Filters copyWith({String? season}) {
    return Filters(season: season ?? this.season);
  }

  Map<String, Object?> toJson() {
    return {'season': season};
  }

  static Filters fromJson(Map<String, Object?> json) {
    return Filters(season: json['season'] == null ? '' : json['season'] as String);
  }

  @override
  String toString() {
    return 'Filters(season:$season)';
  }

  @override
  bool operator ==(Object other) {
    return other is Filters && other.runtimeType == runtimeType && other.season == season;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, season);
  }
}
