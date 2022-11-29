import 'dart:async';

import 'package:fifa_worldcup/competetions.dart';
import 'package:fifa_worldcup/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key, required this.seek, required this.data}) : super(key: key);
  final bool seek;
  final WorldcupCompetitions data;
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late VideoPlayerController _controller;
  bool _visible = false;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    _controller = VideoPlayerController.asset("assets/videosplash.mp4");
    _controller.initialize().then((_) {
      //   _controller.setLooping(true);
      Timer(const Duration(milliseconds: 100), () async {
        await _controller.seekTo(Duration(seconds: widget.seek ? 20 : 0));
        await _controller.play();
        setState(() {
          _visible = true;
        });
      });
    });

    Future.delayed(Duration(seconds: widget.seek ? 10 : 27), () {
      Get.offUntil(
        MaterialPageRoute(
          builder: (context) => QatarWorldCup(
            title: 'FIFA WORLD CUP QATAR 2022',
            data: widget.data,
          ),
        ),
        (e) => false,
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      // If your background video doesn't look right, try changing the BoxFit property.
      // BoxFit.fill created the look I was going for.
      fit: BoxFit.fill,
      child: SizedBox(
        width: Get.width,
        height: Get.height,
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 1000),
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }
}
