import 'dart:async';
import 'dart:io';
import 'package:fifa_worldcup/lib.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if ((Platform.isAndroid || Platform.isIOS) && kDebugMode) {
    await WakelockPlus.enable();
  }
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(
    ScreenUtilInit(
      designSize: const Size(360.0, 806.0),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return GetMaterialApp(
          title: 'كأس العالم فيفا قطر 2022',
          locale: const Locale('ar'),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Qatar2022',
            primarySwatch: primarycolor,
          ),
          home: const SplashPage(seek: true),
        );
      },
    ),
  );
}

class QatarWorldCup extends StatefulWidget {
  const QatarWorldCup({super.key, required this.title});
  /* required this.standings,
    required this.matches, */
  /* final WorldcupMatches matches;
  final WorldcupStandings standings; */
  final String title;

  @override
  State<QatarWorldCup> createState() => _QatarWorldCupState();
}

class _QatarWorldCupState extends State<QatarWorldCup> {
  late AudioPlayer player;
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    player = AudioPlayer();
    unawaited(startAudio());
    unawaited(SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]));

    videoPlayerController = VideoPlayerController.asset("assets/videosplash.mp4");
    /* videoPlayerController.initialize().then((_) => videoPlayerController.play()); */
    super.initState();
  }

  Future<void> startAudio() async {
    await player.setAsset('assets/yallayalla.mp3');
    await player.setVolume(0.5);
    await player.setLoopMode(LoopMode.all);
    await player.play();
    // await player.pause();
    // await player.seek(const Duration(seconds: 10));
    // await player.setSpeed(2.0);
    // await player.stop();
  }

  Future<void> pauseAudio() async {
    await player.pause();
  }

  @override
  void dispose() {
    unawaited(pauseAudio());
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Console.log(widgets2.map((e) => '${e.stage} ${e.matches.length} || '));
    return SafeArea(
      child: Scaffold(
        /* appBar: AppBar(
          title: Text(widget.title),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/pattern.png',
                ),
                fit: BoxFit.cover,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          elevation: 0,
        ), */
        body: FutureBuilder<MAtchesAndStandings>(
          future: fifaWCStandingsAndMatches(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var dateTime = DateTime.now().toUtc();

              return SingleChildScrollView(
                // physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      children: [
                        ClipPath(
                          clipper: Customshape(),
                          child: Container(
                            height: 200.h,
                            width: MediaQuery.of(context).size.width,
                            color: const Color(primarycolorPrimaryValue),
                            child: const Stack(
                              children: [
                                BackgroundPattern(),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: Get.width * .3,
                            child: Image.asset('assets/logo.png'),
                          ),
                        ),
                        Positioned(
                          top: 36.h,
                          right: 24.w,
                          child: SizedBox(
                            width: Get.width * .75,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.title,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'قطر 2022',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 48.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    ...modelData(snapshot.data!.matches).map(
                      (e) => ExpansionTile(
                        title: Text(
                          stageName(e.stage),
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        children: (e.groupMatches.isEmpty
                                ? e.matches.map((e) => e.toView())
                                : e.groupMatches.map(
                                    (e) {
                                      var firstStandl = snapshot.data!.standings.firstWhereOrNull((element) => element.group == e.group);
                                      return Padding(
                                        padding: const EdgeInsets.only(left: 18.0, right: 10),
                                        child: ExpansionTile(
                                          title: Text(e.group.replaceAll('GROUP_', 'المجموعة ')),
                                          children: [
                                            ...e.matches.map((e) => e.toView()).toList(),
                                            if (firstStandl != null) firstStandl.toView(),
                                          ],
                                        ),
                                      );
                                    },
                                  ))
                            .toList(),
                      ),
                    ),
                    GoalRankk(
                        gls: goalsRanking(snapshot.data!.matches.where((element) {
                      var matchTime = DateTime.parse(element.utcDate);
                      var isStarted = matchTime.isBefore(dateTime);
                      return isStarted;
                    }).toList())),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          ClipPath(clipper: TheAinFIFA(), child: containerBack(.25)),
                          ClipPath(clipper: TheFinFIFA(), child: containerBack(.2)),
                          const Expanded(child: SizedBox()),
                          ClipPath(clipper: TheIinFIFA(), child: containerBack(.1)),
                          const Expanded(child: SizedBox()),
                          ClipPath(clipper: TheFinFIFA(), child: containerBack(.2)),
                        ],
                      ),
                    ),
                    //   ClipPath(clipper: TheFIFAClipper(), child: containerBack(1)),
                    // ...widget.standings.standings.map((e) => TableStanding(standing: e)),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: primarycolor.shade100,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

Widget containerBack(double widthPercent) {
  return Builder(builder: (context) {
    return Container(
      height: 200.h,
      width: MediaQuery.of(context).size.width * widthPercent,
      color: const Color(primarycolorPrimaryValue),
      child: const Stack(
        children: [BackgroundPattern()],
      ),
    );
  });
}

class BackgroundPattern extends StatelessWidget {
  const BackgroundPattern({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: const Image(
        image: AssetImage(
          'assets/pattern.png',
        ),
        fit: BoxFit.cover,
        repeat: ImageRepeat.repeat,
      ),
    );
  }
}

String stageName(title) {
  switch (title) {
    case 'GROUP_STAGE':
      return "دور المجموعات";

    case 'LAST_16':
      return "دور الـ16";

    case 'QUARTER_FINALS':
      return "ربع النهائي";

    case 'SEMI_FINALS':
      return "نصف النهائي";

    case 'THIRD_PLACE':
      return "المركز الثالث";

    case 'BRONZE':
      return "البرونزية";

    case 'FINAL':
      return "النهائي";

    default:
      return title;
  }
}

// SizedBox(width: Get.width * .75, child: Image.asset('assets/qatar_word.png')),
// ...widgets(widget.matches.matches).map((e) => e.view()),
/* ListView.builder(
    itemCount: widgets2.length,
    shrinkWrap: true,
    itemBuilder: (BuildContext context, int index) => _buildList(widgets2[index]),
), */
// leading: list.icon != null ? Icon(list.icon) : null,
bool ine(Matche e) => e.homeTeam.crest.isNotEmpty;

class GroupMatches {
  String group;
  List<Matche> matches;
  GroupMatches({required this.group, required this.matches});
}

class StageWithMatches {
  String stage;
  List<Matche> matches;
  List<GroupMatches> groupMatches = [];
  StageWithMatches({required this.stage, required this.matches, this.groupMatches = const []});
  Widget view() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            stage,
            style: TextStyle(
              fontSize: 36.sp,
              color: const Color(0xFFA9A9A9),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...matches.where(ine).map((e) => e.toView())
      ],
    );
  }
}

List<GoalRanking> goalsRanking(List<Matche> matches) {
  var gls = matches.fold<List<GoalRanking>>(
    matches.fold(
      [],
      (previousRankings, currentMatche) {
        if (previousRankings.where((e) => e.team == currentMatche.homeTeam).isEmpty) {
          previousRankings.add(GoalRanking(team: currentMatche.homeTeam));
        }
        return previousRankings;
      },
    ),
    (previousMatches2, currentMatche2) {
      var homeTeam = previousMatches2.firstWhereOrNull((e) => e.team == currentMatche2.homeTeam);
      var awayTeam = previousMatches2.firstWhereOrNull((e) => e.team == currentMatche2.awayTeam);
      if (awayTeam != null) {
        awayTeam.increaseReceiveFullTime = currentMatche2.score.fullTime.home;
        awayTeam.increaseScoredFullTime = currentMatche2.score.fullTime.away;
        //
        awayTeam.increaseReceiveExtraTime = currentMatche2.score.extraTime.home;
        awayTeam.increaseScoredExtraTime = currentMatche2.score.extraTime.away;
        //
        awayTeam.increaseReceiveRegularTime = currentMatche2.score.regularTime.home;
        awayTeam.increaseScoredRegularTime = currentMatche2.score.regularTime.away;
        //
        awayTeam.increaseReceivePenalties = currentMatche2.score.penalties.home;
        awayTeam.increaseScoredPenalties = currentMatche2.score.penalties.away;
      }
      if (homeTeam != null) {
        homeTeam.increaseReceiveFullTime = currentMatche2.score.fullTime.away;
        homeTeam.increaseScoredFullTime = currentMatche2.score.fullTime.home;
        //
        homeTeam.increaseReceiveExtraTime = currentMatche2.score.extraTime.away;
        homeTeam.increaseScoredExtraTime = currentMatche2.score.extraTime.home;
        //
        homeTeam.increaseReceiveRegularTime = currentMatche2.score.regularTime.away;
        homeTeam.increaseScoredRegularTime = currentMatche2.score.regularTime.home;
        //
        homeTeam.increaseReceivePenalties = currentMatche2.score.penalties.away;
        homeTeam.increaseScoredPenalties = currentMatche2.score.penalties.home;
      }
      return previousMatches2;
    },
  );

  return gls;
}

List<StageWithMatches> modelData(List<Matche> matches) {
  var vari = matches.fold<List<StageWithMatches>>(
    [],
    (previousValue, element) {
      var wheras = previousValue.where((e) => e.stage == element.stage);
      if (wheras.isEmpty) {
        previousValue.add(StageWithMatches(stage: element.stage, matches: [element]));
      } else {
        wheras.first.matches.add(element);
      }
      return previousValue;
    },
  );
  var groupStage = vari.where((e) => e.stage == 'GROUP_STAGE');
  var groupStageNotEmpty = groupStage.isNotEmpty;
  if (groupStageNotEmpty) {
    var expansionGroups = groupStage.first.matches.fold<List<GroupMatches>>([], (previousValue, element) {
      var wheras = previousValue.where((e) => e.group == element.group);
      if (wheras.isEmpty) {
        previousValue.add(GroupMatches(group: element.group, matches: [element]));
      } else {
        wheras.first.matches.add(element);
      }
      return previousValue;
    });
    // Console.log(expansionGroups.map((e) => '${e.group} ${e.matches.length} || '));
    expansionGroups.sort((a, b) => Comparable.compare(a.group, b.group));
    groupStage.first.groupMatches = expansionGroups;
  }
  return vari;
}

class GoalRanking {
  Team team;
  int scoredFT;
  int receivedFT;
  int scoredRT;
  int receivedRT;
  int scoredET;
  int receivedET;
  int scoredPT;
  int receivedPT;
  GoalRanking({
    required this.team,
    this.receivedFT = 0,
    this.scoredFT = 0,
    this.scoredRT = 0,
    this.receivedRT = 0,
    this.scoredET = 0,
    this.receivedET = 0,
    this.scoredPT = 0,
    this.receivedPT = 0,
  });

  set increaseReceivePenalties(int score) {
    receivedPT += score;
  }

  set increaseScoredPenalties(int score) {
    scoredPT += score;
  }

  set increaseReceiveExtraTime(int score) {
    receivedET += score;
  }

  set increaseScoredExtraTime(int score) {
    scoredET += score;
  }

  set increaseReceiveRegularTime(int score) {
    receivedRT += score;
  }

  set increaseScoredRegularTime(int score) {
    scoredRT += score;
  }

  set increaseReceiveFullTime(int score) {
    receivedFT += score;
  }

  set increaseScoredFullTime(int score) {
    scoredFT += score;
  }

  @override
  String toString() {
    return '${team.name} received: $receivedFT and scored $scoredFT';
  }
}
