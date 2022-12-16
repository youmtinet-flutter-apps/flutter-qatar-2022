import 'dart:async';

import 'package:console_tools/console_tools.dart';
import 'package:fifa_worldcup/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:native_video_player/native_video_player.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key, required this.seek}) : super(key: key);
  final bool seek;
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
//   late VideoPlayerController _controller;
  bool _visible = false;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    /* _controller = VideoPlayerController.asset("assets/videosplash.mp4");
    _controller.initialize().then((_) { */
    //   _controller.setLooping(true);
    Timer(const Duration(milliseconds: 100), () async {
      /* await _controller.seekTo(Duration(seconds: widget.seek ? 20 : 0));
        await _controller.play(); */
      setState(() {
        _visible = true;
      });
    });
    /* }); */

    /* Future.delayed(Duration(seconds: widget.seek ? 8 : 27), () {
      Get.offUntil(
        MaterialPageRoute(
          builder: (context) => const QatarWorldCup(title: 'كأس العالم فيفا'),
        ),
        (e) => false,
      );
    }); */

    super.initState();
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  double videoH = Get.height;
  double videoW = Get.width;
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
          //   child: VideoPlayer(_controller),
          child: Transform.scale(
            scaleY: (Get.height - Get.statusBarHeight) / videoH,
            child: NativeVideoPlayerView(
              onViewReady: (controller) async {
                final videoSource = await VideoSource.init(path: 'assets/videosplash.mp4', type: VideoSourceType.asset);
                await controller.loadVideoSource(videoSource);
                await controller.seekForward(widget.seek ? 20 : 0);
                await controller.setVolume(1);
                await controller.play();
                controller.onPlaybackReady.addListener(() {
                  final videoInfo = controller.videoInfo;
                  if (videoInfo != null) {
                    final videoHeight = videoInfo.height;
                    setState(() {
                      videoH = videoHeight + 0.0;
                    });
                    /* final videoWidth = videoInfo.width;
                    final videoDuration = videoInfo.duration; */
                  }
                });
                controller.onPlaybackStatusChanged.addListener(() {
                  var playbackInfo = controller.playbackInfo;
                  if (playbackInfo != null) {
                    final playbackStatus = playbackInfo.status;
                    if (playbackStatus == PlaybackStatus.stopped) {
                      Get.offUntil(
                        MaterialPageRoute(
                          builder: (context) => const QatarWorldCup(title: 'كأس العالم فيفا'),
                        ),
                        (e) => false,
                      );
                    }
                  }
                  // playbackStatus can be playing, paused, or stopped.
                });
                controller.onPlaybackPositionChanged.addListener(() {
                  var playbackInfo = controller.playbackInfo;
                  if (playbackInfo != null) {
                    final playbackPosition = playbackInfo.position;
                    Console.log(playbackPosition, color: ConsoleColors.greenSap);
                  }
                });
                controller.onPlaybackEnded.addListener(() {});
              },
            ),
          ),
        ),
      ),
    );
  }
}
