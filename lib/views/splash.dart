import 'dart:async';
import 'package:fifa_worldcup/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key, required this.seek}) : super(key: key);
  final bool seek;
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _visible = false;
  bool _ended = false;

  late VideoPlayerController _controller;
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _controller = VideoPlayerController.asset('assets/videosplash.mp4') //
      ..initialize().then((_) {
        _controller.seekTo(const Duration(seconds: 20));
        _controller.play().then((value) => setState(() {}));
      });

    _controller.addListener(() async {
      bool ended = _controller.value.position == _controller.value.duration;
      if (ended) {
        if (!_ended) {
          setState(() {
            _ended = ended;
          });
        } else {
          await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
          await Get.offUntil(
            MaterialPageRoute(
              builder: (context) => const QatarWorldCup(title: 'كأس العالم فيفا'),
            ),
            (e) => false,
          );
        }
      }
    });
    Timer(const Duration(milliseconds: 100), () async {
      setState(() {
        _visible = true;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double videoH = Get.height;
  double videoW = Get.width;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: Get.width,
      height: Get.height,
      child: _controller.value.isInitialized
          ? AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 1000),
              child: AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller)),
            ) //
          : Container(color: Colors.red, width: Get.width, height: Get.height),
    );
    // child: CachedNetworkImage(imageUrl: 'https://node-auth-master.youmrabti.com/imagi-20240314-150055.jpg'),
    // child: _videoSplashContent(),
  }
}
