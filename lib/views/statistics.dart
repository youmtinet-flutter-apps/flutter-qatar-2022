import 'package:fifa_worldcup/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoalRankk extends StatelessWidget {
  const GoalRankk({super.key, required this.gls});
  final List<GoalRanking> gls;

  @override
  Widget build(BuildContext context) {
    // var matchTimeLocal = DateFormat.MMMMd(Get.locale).format(matchTime);
    var sortDownToUpReceived = gls.map((e) => e).toList()..sort((a, b) => Comparable.compare(a.receivedFT, b.receivedFT));
    var leastReceived = sortDownToUpReceived.firstWhereOrNull((element) => true);
    //
    var sortUpToDownReceived = gls.map((e) => e).toList()..sort((a, b) => Comparable.compare(b.receivedFT, a.receivedFT));
    var mostReceived = sortUpToDownReceived.firstWhereOrNull((element) => true);
    //
    var sortUpToDownScored = gls.map((e) => e).toList()..sort((a, b) => Comparable.compare(a.scoredFT, b.scoredFT));
    var leastScored = sortUpToDownScored.firstWhereOrNull((element) => true);
    //
    var sortDownToUpScored = gls.map((e) => e).toList()..sort((a, b) => Comparable.compare(b.scoredFT, a.scoredFT));
    var mostScored = sortDownToUpScored.firstWhereOrNull((element) => true);
    //  // // // // // //
    var sortDownToUpScoreDifference = gls.map((e) => e).toList()..sort((a, b) => Comparable.compare(a.scoredFT - a.receivedFT, b.scoredFT - b.receivedFT));
    var leastDifference = sortDownToUpScoreDifference.firstWhereOrNull((element) => true);
    //
    var sortUpToDownScoreDifference = gls.map((e) => e).toList()..sort((a, b) => Comparable.compare(b.scoredFT - b.receivedFT, a.scoredFT - a.receivedFT));
    var mostDifference = sortUpToDownScoreDifference.firstWhereOrNull((element) => true);
    //

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ExpansionTile(
          title: const Text('إحصائيات'),
          children: sortDownToUpScored.map((e) {
            var indexOf = sortDownToUpScored.indexOf(e);
            var elementAt = sortDownToUpReceived.elementAt(indexOf);
            var tLTxt2 = (indexOf == 0)
                ? 'لأكثر تسجيلا'
                : (indexOf == sortDownToUpScored.length - 1)
                    ? 'الأقل تسجيلا'
                    : 'سجل';
            var tRTxt2 = (indexOf == 0)
                ? 'الأقل استقبالا'
                : (indexOf == sortDownToUpScored.length - 1)
                    ? 'لأكثر استقبالا'
                    : 'استقبل';
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                height: 100,
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
              height: 100,
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
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                height: 100,
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                height: 100,
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
            ),
          ],
        ),
        ExpansionTile(
          title: const Text('إحصائيات الأهداف'),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GoalStatistic(
                text: 'الوقت الأصلي',
                intvalueScored: gls.fold(0, (previousValue, element) => previousValue + element.scoredRT),
                intvalueReceived: gls.fold(0, (previousValue, element) => previousValue + element.receivedRT),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GoalStatistic(
                text: 'الوقت الاضافي',
                intvalueScored: gls.fold(0, (previousValue, element) => previousValue + element.scoredET),
                intvalueReceived: gls.fold(0, (previousValue, element) => previousValue + element.receivedET),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GoalStatistic(
                text: 'ركلات الترجيح',
                intvalueScored: gls.fold(0, (previousValue, element) => previousValue + element.scoredPT),
                intvalueReceived: gls.fold(0, (previousValue, element) => previousValue + element.receivedPT),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GoalStatistic(
                text: 'المبارات',
                intvalueScored: gls.fold(0, (previousValue, element) => previousValue + element.scoredFT),
                intvalueReceived: gls.fold(0, (previousValue, element) => previousValue + element.receivedFT),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class GoalStatistic extends StatelessWidget {
  const GoalStatistic({Key? key, required this.text, required this.intvalueScored, required this.intvalueReceived}) : super(key: key);

  final String text;
  final int intvalueScored;
  final int intvalueReceived;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('مجموع الأهداف المسجلة في $text', textAlign: TextAlign.right),
                Text('$intvalueScored', textAlign: TextAlign.right),
              ],
            ),
          ),
          const Divider(height: 50, thickness: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('إجمالي الأهداف التي تم تلقيها في $text', textAlign: TextAlign.right),
                Text('$intvalueReceived', textAlign: TextAlign.left),
              ],
            ),
          ),
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
          color: primarycolor.shade50,
        ),
        height: 100,
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
                    Text('${teamLeft.scoredFT}', textAlign: TextAlign.right),
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
                    Text('${teamRight.receivedFT}', textAlign: TextAlign.left),
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
          color: primarycolor,
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
