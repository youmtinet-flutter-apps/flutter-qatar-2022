// import 'package:console_tools/console_tools.dart';
import 'dart:async';

import 'package:fifa_worldcup/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class MatchView extends StatefulWidget {
  const MatchView({super.key, required this.match});
  final Matche match;
  @override
  State<MatchView> createState() => _MatchViewState();
}

class _MatchViewState extends State<MatchView> {
  @override
  void initState() {
    unawaited(initializeDateFormatting('ar', null));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var matchTime = DateTime.parse(widget.match.utcDate);
    // var matchTimeLocal = DateFormat.MMMMd(Get.locale).format(matchTime);
    var isNotStarted = matchTime.isBefore(DateTime.now());
    var homeTeamTla = widget.match.homeTeam.tla;
    var awayTeamTla = widget.match.awayTeam.tla;
    var localeTime = DateFormat.Hm(Get.locale!.languageCode).format(matchTime);
    var localeDate = DateFormat.MEd(Get.locale!.languageCode).format(matchTime);
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: FittedBox(
                child: Container(
                  decoration: const BoxDecoration(
                    color: primarycolor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(36),
                      bottomRight: Radius.circular(36),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TeamAvatar(
                          team: Team.fromJson({}).copyWith(
                            crest: widget.match.awayTeam.crest,
                            id: widget.match.awayTeam.id,
                            name: widget.match.awayTeam.name,
                            shortName: widget.match.awayTeam.name,
                            tla: awayTeamTla,
                          ),
                        ),
                        Text(
                          awayTeamTla.isEmpty ? 'TBD' : awayTeamTla,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: primarycolor.shade50,
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text(
                            '${isNotStarted ? widget.match.score.fullTime.away : '-'}',
                            textAlign: TextAlign.center,
                          )),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(statusMatch(widget.match.status)),
                            Text(convertNumbers(localeTime)),
                            Text(convertNumbers(localeDate)),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '${isNotStarted ? widget.match.score.fullTime.home : '-'}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FittedBox(
                child: Container(
                  decoration: const BoxDecoration(
                    color: primarycolor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36),
                      bottomLeft: Radius.circular(36),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TeamAvatar(
                          team: Team.fromJson({}).copyWith(
                            crest: widget.match.homeTeam.crest,
                            id: widget.match.homeTeam.id,
                            name: widget.match.homeTeam.name,
                            shortName: widget.match.homeTeam.name,
                            tla: homeTeamTla,
                          ),
                        ),
                        Text(
                          homeTeamTla.isEmpty ? 'TBD' : homeTeamTla,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String convertNumbers(String str) {
  return str.replaceAll('٠', '0').replaceAll('١', '1').replaceAll('٢', '2').replaceAll('٣', '3').replaceAll('٤', '4').replaceAll('٥', '5').replaceAll('٦', '6').replaceAll('٧', '7').replaceAll('٨', '8').replaceAll('٩', '9');
}

String statusMatch(status) {
  switch (status) {
    case 'FINISHED':
      return "انتهت";

    case 'TIMED':
      return "مبرمجة";

    case 'IN_PLAY':
      return "تلعب الآن";
    case 'PAUSED':
      return "بين الشوطين";

    default:
      return '';
  }
}
