import 'package:fifa_worldcup/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoalRankk extends StatelessWidget {
  const GoalRankk({super.key, required this.gls});
  final List<GoalRanking> gls;

  @override
  Widget build(BuildContext context) {
    // var matchTimeLocal = DateFormat.MMMMd(Get.locale).format(matchTime);
    var sortDownToUpReceived = gls.map((e) => e).toList()..sort((a, b) => Comparable.compare(a.received, b.received));
    var leastReceived = sortDownToUpReceived.firstWhereOrNull((element) => true);
    //
    var sortUpToDownReceived = gls.map((e) => e).toList()..sort((a, b) => Comparable.compare(b.received, a.received));
    var mostReceived = sortUpToDownReceived.firstWhereOrNull((element) => true);
// // // // // // //
    var sortUpToDownScored = gls.map((e) => e).toList()..sort((a, b) => Comparable.compare(a.scored, b.scored));
    var leastScored = sortUpToDownScored.firstWhereOrNull((element) => true);
    //
    var sortDownToUpScored = gls.map((e) => e).toList()..sort((a, b) => Comparable.compare(b.scored, a.scored));
    var mostScored = sortDownToUpScored.firstWhereOrNull((element) => true);
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
          title: const Text('Quick statistics'),
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
          ],
        ),
        Container(
          decoration: BoxDecoration(color: primarycolor.shade50),
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
                      const Text('Total goals scored', textAlign: TextAlign.right),
                      Text('${gls.fold(0, (previousValue, element) => previousValue + element.scored)}', textAlign: TextAlign.right),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Total goals received', textAlign: TextAlign.right),
                      Text('${gls.fold(0, (previousValue, element) => previousValue + element.received)}', textAlign: TextAlign.left),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
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
                    Text('${teamLeft.scored} ${teamLeft.team.tla}', textAlign: TextAlign.right),
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
                    Text('${teamRight.received} ${teamRight.team.tla}', textAlign: TextAlign.left),
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
