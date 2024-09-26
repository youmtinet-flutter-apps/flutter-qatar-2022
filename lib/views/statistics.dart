import 'package:fifa_worldcup/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GoalRankk extends StatelessWidget {
  const GoalRankk({
    super.key,
    required this.gls,
    required this.goalRanking,
  });
  final List<GoalRanking> gls;
  final GlobalGoalRanking goalRanking;
  @override
  Widget build(BuildContext context) {
    // var matchTimeLocal = DateFormat.MMMMd(Get.locale).format(matchTime);
    List<GoalRanking> sortDownToUpReceived = gls.map((e) => e).toList()
      ..sort((a, b) => Comparable.compare(
            a.allReceived,
            b.allReceived,
          ));
    GoalRanking? leastReceived = sortDownToUpReceived.firstWhereOrNull((element) => true);
    List<GoalRanking> sortUpToDownReceived = gls.map((e) => e).toList()
      ..sort((a, b) => Comparable.compare(
            b.allReceived,
            a.allReceived,
          ));
    GoalRanking? mostReceived = sortUpToDownReceived.firstWhereOrNull((element) => true);
    List<GoalRanking> sortUpToDownScored = gls.map((e) => e).toList()
      ..sort((a, b) => Comparable.compare(
            a.allScored,
            b.allScored,
          ));
    GoalRanking? leastScored = sortUpToDownScored.firstWhereOrNull((element) => true);
    List<GoalRanking> sortDownToUpScored = gls.map((e) => e).toList()
      ..sort((a, b) => Comparable.compare(
            b.allScored,
            a.allScored,
          ));
    GoalRanking? mostScored = sortDownToUpScored.firstWhereOrNull((element) => true);
    List<GoalRanking> sortDownToUpScoreDifference = gls.map((e) => e).toList()
      ..sort(
        (a, b) => Comparable.compare(
          a.allScored - a.allReceived,
          b.allScored - b.allReceived,
        ),
      );
    GoalRanking? leastDifference = sortDownToUpScoreDifference.firstWhereOrNull((element) => true);

    List<GoalRanking> sortUpToDownScoreDifference = gls.map((e) => e).toList()
      ..sort(
        (a, b) => Comparable.compare(
          b.allScored - b.allReceived,
          a.allScored - a.allReceived,
        ),
      );
    GoalRanking? mostDifference = sortUpToDownScoreDifference.firstWhereOrNull((element) => true);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ExpansionTile(
          title: const Text('إحصائيات'),
          children: sortDownToUpScored.map((e) {
            var indexOf = sortDownToUpScored.indexOf(e);
            var elementAt = sortDownToUpReceived.elementAt(indexOf);
            var tLTxt2 = _getMostScoringText(indexOf, sortDownToUpScored.length);
            var tRTxt2 = _getMostReceivingText(indexOf, sortDownToUpScored.length);
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                height: 101.h,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                  child: Row(
                    children: [
                      RoundedTeam(team: e),
                      CenterContent(teamLeft: e, teamLeftText: tLTxt2, teamRight: elementAt, teamRightText: tRTxt2),
                      RoundedTeam(team: elementAt, left: false),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        ExpansionTile(
          title: const Text('إحصائيات سريعة'),
          children: [
            SizedBox(
              height: 101.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                child: Row(
                  children: [
                    if (mostScored != null) RoundedTeam(team: mostScored),
                    if (mostScored != null && leastReceived != null)
                      CenterContent(
                        teamLeft: mostScored,
                        teamLeftText: 'لأكثر تسجيلا', //
                        teamRight: leastReceived,
                        teamRightText: 'الأقل استقبالا',
                      ),
                    if (leastReceived != null) RoundedTeam(team: leastReceived, left: false),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 101.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                child: Row(
                  children: [
                    if (leastScored != null) RoundedTeam(team: leastScored),
                    if (leastScored != null && mostReceived != null)
                      CenterContent(
                        teamLeft: leastScored,
                        teamLeftText: 'الأقل تسجيلا',
                        teamRight: mostReceived,
                        teamRightText: 'لأكثر استقبالا',
                      ),
                    if (mostReceived != null) RoundedTeam(team: mostReceived, left: false),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 101.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                child: Row(
                  children: [
                    if (leastDifference != null) RoundedTeam(team: leastDifference),
                    if (leastDifference != null && mostDifference != null)
                      CenterContent(
                        teamLeft: leastDifference,
                        teamLeftText: 'الأقل فارقا',
                        teamRight: mostDifference,
                        teamRightText: 'لأكثر فارقا',
                      ),
                    if (mostDifference != null) RoundedTeam(team: mostDifference, left: false),
                  ],
                ),
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: const Text('إحصائيات الأهداف'),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GoalStatistic(text: 'الوقت الأصلي', intvalueScored: goalRanking.scoredRT),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GoalStatistic(text: 'الوقت الاضافي', intvalueScored: goalRanking.scoredET),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GoalStatistic(text: 'ركلات الترجيح', intvalueScored: goalRanking.scoredPT),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GoalStatistic(
                text: 'المبارات',
                intvalueScored: goalRanking.scoredFT,
              ),
            ),
          ],
        )
      ],
    );
  }

  String _getMostReceivingText(int indexOf, int len) {
    return (indexOf == 0)
        ? 'الأقل استقبالا'
        : (indexOf == len - 1)
            ? 'لأكثر استقبالا'
            : 'استقبل';
  }

  String _getMostScoringText(int indexOf, int len) {
    return (indexOf == 0)
        ? 'لأكثر تسجيلا'
        : (indexOf == len - 1)
            ? 'الأقل تسجيلا'
            : 'سجل';
  }
}

class GoalStatistic extends StatelessWidget {
  const GoalStatistic({
    Key? key,
    required this.text,
    required this.intvalueScored,
  }) : super(key: key);

  final String text;
  final int intvalueScored;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 3,
            child: Text.rich(
              TextSpan(
                text: 'مجموع الأهداف المسجلة في ',
                children: [
                  TextSpan(text: text, style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor)),
                ],
              ),
            ),
          ),
          Expanded(flex: 1, child: Text('$intvalueScored', textAlign: TextAlign.center)),
        ],
      ),
    );
  }
}

class CenterContent extends StatelessWidget {
  const CenterContent({
    Key? key,
    required this.teamLeft,
    required this.teamRight,
    required this.teamLeftText,
    required this.teamRightText,
  }) : super(key: key);

  final GoalRanking teamLeft;
  final GoalRanking teamRight;
  final String teamLeftText;
  final String teamRightText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor.shade50,
        ),
        height: 100.h,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(teamLeftText, textAlign: TextAlign.right),
                    Text('${teamLeft.allScored}', textAlign: TextAlign.right),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(teamRightText, textAlign: TextAlign.right),
                    Text('${teamRight.allReceived}', textAlign: TextAlign.left),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedTeam extends StatelessWidget {
  const RoundedTeam({
    Key? key,
    required this.team,
    this.left = true,
  }) : super(key: key);

  final GoalRanking team;
  final bool left;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            topRight: left ? const Radius.circular(36) : Radius.zero,
            bottomRight: left ? const Radius.circular(36) : Radius.zero,
            topLeft: !left ? const Radius.circular(36) : Radius.zero,
            bottomLeft: !left ? const Radius.circular(36) : Radius.zero,
          ),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TeamAvatar(team: team.team),
              Text(
                team.team.tla,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
