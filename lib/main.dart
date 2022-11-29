import 'dart:async';
import 'dart:convert';

import 'package:console_tools/console_tools.dart';
import 'package:fifa_worldcup/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:just_audio/just_audio.dart';
import 'package:video_player/video_player.dart';

void main() async {
  WorldcupCompetitions data = await fifaWCStandings() ?? WorldcupCompetitions.fromJson({});
  runApp(
    GetMaterialApp(
      title: 'FIFA WORLD CUP QATAR 2022',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Qatar2022',
        primarySwatch: primarycolor,
      ),
      home: SplashPage(seek: true, data: data),
    ),
  );
}

Future<WorldcupCompetitions?> fifaWCStandings() async {
  var headers = {'X-Auth-Token': token};
  var request = Request('GET', Uri.parse('https://api.football-data.org/v4/competitions/2000/standings'));

  request.headers.addAll(headers);

  StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var text = await response.stream.bytesToString();
    var fromJson = WorldcupCompetitions.fromJson(json.decode(text));
    return fromJson;
  } else {
    Console.log(response.reasonPhrase);
  }
  return null;
}

class QatarWorldCup extends StatefulWidget {
  const QatarWorldCup({super.key, required this.title, required this.data});

  final WorldcupCompetitions data;
  final String title;

  @override
  State<QatarWorldCup> createState() => _QatarWorldCupState();
}

class _QatarWorldCupState extends State<QatarWorldCup> {
  @override
  void initState() {
    unawaited(startAudio());
    unawaited(SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]));

    videoPlayerController = VideoPlayerController.asset("assets/videosplash.mp4");
    /* videoPlayerController.initialize().then((_) => videoPlayerController.play()); */

    super.initState();
  }

/* final duration =  */
  late VideoPlayerController videoPlayerController;
  Future<void> startAudio() async {
    final player = AudioPlayer();
    await player.setAsset('assets/yallayalla.mp3');
    await player.setVolume(0.5);
    await player.setLoopMode(LoopMode.all);
    await player.play();
    // await player.pause();
    // await player.seek(const Duration(seconds: 10));
    // await player.setSpeed(2.0);
    // await player.stop();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VideoPlayer(videoPlayerController),
        Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/pattern.png'),
                  fit: BoxFit.cover,
                  repeat: ImageRepeat.repeat,
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
                            Align(alignment: Alignment.center, child: Image.asset('assets/pattern.png')),
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
                ...widget.data.standings
                    .map((e) => TableStanding(
                          standing: e,
                        ))
                    .toList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Customshape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, height - 50);
    path.lineTo(width, height);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
/* body: VimeoVideoPlayer(
vimeoPlayerModel: VimeoPlayerModel(
url: 'https://vimeo.com/70591644',

),
), */
/* body: ClipRect(
child: AspectRatio(
aspectRatio: videoPlayerController.value.aspectRatio,
child: VideoPlayer(videoPlayerController),
),
), */
/* FittedBox(
fit: BoxFit.fitWidth,
child: SizedBox(
width: Get.width,
height: Get.height,
child: AnimatedOpacity(
opacity: _visible ? 1.0 : 0.0,
duration: const Duration(milliseconds: 1000),
child: VideoPlayer(_controller),
),
),
), */