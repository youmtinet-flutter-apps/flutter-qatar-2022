import 'dart:async';
import 'package:fifa_worldcup/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:video_player/video_player.dart';

void main() async {
  WorldcupStandings standings = await fifaWCStandings() ?? WorldcupStandings.fromJson({});
  WorldcupMatches matches = await fifaWCMatches() ?? WorldcupMatches.fromJson({});
  runApp(
    GetMaterialApp(
      title: 'FIFA WORLD CUP QATAR 2022',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Qatar2022',
        primarySwatch: primarycolor,
      ),
      home: SplashPage(
        seek: true,
        standings: standings,
        matches: matches,
      ),
    ),
  );
}

class QatarWorldCup extends StatefulWidget {
  const QatarWorldCup({
    super.key,
    required this.title,
    required this.standings,
    required this.matches,
  });
  final WorldcupMatches matches;
  final WorldcupStandings standings;
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
    var widgets2 = widgets(widget.matches.matches);
    // Console.log(widgets2.map((e) => '${e.stage} ${e.matches.length} || '));
    return Stack(
      children: [
        VideoPlayer(videoPlayerController),
        Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/pattern.png',
                  ),
                  fit: BoxFit.cover,
                  repeat: ImageRepeat.repeatX,
                ),
              ),
            ),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: [
                    ClipPath(
                      clipper: Customshape(),
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        color: const Color(primarycolorPrimaryValue),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/pattern.png',
                                repeat: ImageRepeat.repeat,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * .3,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset('assets/logo.png'),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: Get.width * .75, child: Image.asset('assets/qatar-word.png')),
                // ...widgets(widget.matches.matches).map((e) => e.view()),
                /* ListView.builder(
                  itemCount: widgets2.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) => _buildList(widgets2[index]),
                ), */
                ...widgets2.map(
                  (e) => ExpansionTile(
                    // leading: list.icon != null ? Icon(list.icon) : null,
                    title: Text(
                      e.stage,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: (e.groupMatches.isEmpty
                            ? e.matches.map(
                                (e) => e.toView(),
                              )
                            : e.groupMatches.map(
                                (e) {
                                  var firstStandl = widget.standings.standings.firstWhereOrNull((element) => element.group == e.group);
                                  return ExpansionTile(
                                    title: Text(e.group),
                                    children: [
                                      ...e.matches.map((e) => e.toView()).toList(),
                                      if (firstStandl != null) firstStandl.toView(),
                                    ],
                                  );
                                },
                              ))
                        .toList(),
                  ),
                ),
                // ...widget.standings.standings.map((e) => TableStanding(standing: e)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

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
            style: const TextStyle(
              fontSize: 36,
              color: Color(0xFFA9A9A9),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...matches.where(ine).map((e) => e.toView())
      ],
    );
  }
}

List<StageWithMatches> widgets(List<Matche> matches) {
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
    groupStage.first.groupMatches = expansionGroups;
  }
  return vari;
}
