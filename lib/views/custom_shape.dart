import 'package:flutter/material.dart';

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

class TheAinFIFA extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Path 1 Fill
    path.moveTo(size.width * 0.34, 0);
    path.lineTo(size.width * 0.65, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.7, size.height);
    path.lineTo(size.width * 0.66, size.height * 0.86);
    path.lineTo(size.width * 0.33, size.height * 0.86);
    path.lineTo(size.width * 0.29, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.34, 0);
    path.lineTo(size.width * 0.34, 0);
    path.moveTo(size.width * 0.49, size.height * 0.26);
    path.lineTo(size.width * 0.38, size.height * 0.67);
    path.lineTo(size.width * 0.61, size.height * 0.67);
    path.lineTo(size.width * 0.61, size.height * 0.67);
    path.lineTo(size.width * 0.49, size.height * 0.26);
    path.lineTo(size.width * 0.49, size.height * 0.26);

    // Path 2 Stroke
    path.moveTo(size.width * 0.34, 0);
    path.lineTo(size.width * 0.65, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.7, size.height);
    path.lineTo(size.width * 0.66, size.height * 0.86);
    path.lineTo(size.width * 0.33, size.height * 0.86);
    path.lineTo(size.width * 0.29, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.34, 0);
    path.lineTo(size.width * 0.34, 0);
    path.moveTo(size.width * 0.49, size.height * 0.26);
    path.lineTo(size.width * 0.38, size.height * 0.67);
    path.lineTo(size.width * 0.61, size.height * 0.67);
    path.lineTo(size.width * 0.61, size.height * 0.67);
    path.lineTo(size.width * 0.49, size.height * 0.26);
    path.lineTo(size.width * 0.49, size.height * 0.26);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class TheFinFIFA extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Path 1 Fill
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.cubicTo(size.width * 0.96, size.height * 0.07, size.width * 0.93, size.height * 0.15, size.width * 0.89, size.height * 0.22);
    path.lineTo(size.width * 0.41, size.height * 0.22);
    path.lineTo(size.width * 0.41, size.height * 0.42);
    path.lineTo(size.width * 0.81, size.height * 0.42);
    path.lineTo(size.width * 0.69, size.height * 0.64);
    path.lineTo(size.width * 0.41, size.height * 0.64);
    path.lineTo(size.width * 0.41, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.lineTo(0, 0);

    // Path 2 Stroke
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.cubicTo(size.width * 0.96, size.height * 0.07, size.width * 0.93, size.height * 0.15, size.width * 0.89, size.height * 0.22);
    path.lineTo(size.width * 0.41, size.height * 0.22);
    path.lineTo(size.width * 0.41, size.height * 0.42);
    path.lineTo(size.width * 0.81, size.height * 0.42);
    path.lineTo(size.width * 0.69, size.height * 0.64);
    path.lineTo(size.width * 0.41, size.height * 0.64);
    path.lineTo(size.width * 0.41, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class TheIinFIFA extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Path 1 Fill
    path.moveTo(size.width * 0.01, 0);
    path.lineTo(size.width * 0.99, 0);
    path.lineTo(size.width * 0.99, size.height);
    path.lineTo(size.width * 0.01, size.height);
    path.lineTo(size.width * 0.01, 0);
    path.lineTo(size.width * 0.01, 0);

    // Path 2 Stroke
    path.moveTo(size.width * 0.01, 0);
    path.lineTo(size.width * 0.99, 0);
    path.lineTo(size.width * 0.99, size.height);
    path.lineTo(size.width * 0.01, size.height);
    path.lineTo(size.width * 0.01, 0);
    path.lineTo(size.width * 0.01, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class TheFIFAClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Path 1 Fill
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.87, 0);
    path.cubicTo(size.width * 0.87, 0, size.width * 0.88, 0, size.width * 0.88, size.height * 0.01);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.9, size.height);
    path.lineTo(size.width * 0.88, size.height * 0.86);
    path.lineTo(size.width * 0.77, size.height * 0.86);
    path.lineTo(size.width * 0.76, size.height);
    path.lineTo(size.width * 0.66, size.height);
    path.lineTo(size.width * 0.66, size.height);
    path.lineTo(size.width * 0.77, size.height * 0.05);
    path.lineTo(size.width * 0.7, size.height * 0.06);
    path.lineTo(size.width * 0.68, size.height * 0.22);
    path.lineTo(size.width * 0.56, size.height * 0.22);
    path.lineTo(size.width * 0.56, size.height * 0.42);
    path.lineTo(size.width * 0.66, size.height * 0.42);
    path.lineTo(size.width * 0.63, size.height * 0.64);
    path.lineTo(size.width * 0.56, size.height * 0.64);
    path.lineTo(size.width * 0.56, size.height);
    path.lineTo(size.width * 0.46, size.height);
    path.lineTo(size.width * 0.46, size.height * 0.05);
    path.lineTo(size.width * 0.39, size.height * 0.05);
    path.lineTo(size.width * 0.39, size.height);
    path.lineTo(size.width * 0.28, size.height);
    path.lineTo(size.width * 0.28, size.height * 0.05);
    path.lineTo(size.width * 0.25, size.height * 0.05);
    path.lineTo(size.width * 0.23, size.height * 0.17);
    path.cubicTo(size.width * 0.23, size.height * 0.19, size.width * 0.23, size.height * 0.21, size.width * 0.22, size.height * 0.22);
    path.lineTo(size.width * 0.1, size.height * 0.22);
    path.lineTo(size.width * 0.1, size.height * 0.42);
    path.lineTo(size.width * 0.2, size.height * 0.42);
    path.lineTo(size.width * 0.18, size.height * 0.64);
    path.lineTo(size.width * 0.1, size.height * 0.64);
    path.lineTo(size.width * 0.1, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.lineTo(0, 0);
    path.moveTo(size.width * 0.87, size.height * 0.67);
    path.lineTo(size.width * 0.83, size.height * 0.26);
    path.lineTo(size.width * 0.83, size.height * 0.26);
    path.lineTo(size.width * 0.79, size.height * 0.67);
    path.lineTo(size.width * 0.87, size.height * 0.67);
    path.lineTo(size.width * 0.87, size.height * 0.67);

    // Path 2 Stroke
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.87, 0);
    path.cubicTo(size.width * 0.87, 0, size.width * 0.88, 0, size.width * 0.88, size.height * 0.01);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.9, size.height);
    path.lineTo(size.width * 0.88, size.height * 0.86);
    path.lineTo(size.width * 0.77, size.height * 0.86);
    path.lineTo(size.width * 0.76, size.height);
    path.lineTo(size.width * 0.66, size.height);
    path.lineTo(size.width * 0.66, size.height);
    path.lineTo(size.width * 0.77, size.height * 0.05);
    path.lineTo(size.width * 0.7, size.height * 0.06);
    path.lineTo(size.width * 0.68, size.height * 0.22);
    path.lineTo(size.width * 0.56, size.height * 0.22);
    path.lineTo(size.width * 0.56, size.height * 0.42);
    path.lineTo(size.width * 0.66, size.height * 0.42);
    path.lineTo(size.width * 0.63, size.height * 0.64);
    path.lineTo(size.width * 0.56, size.height * 0.64);
    path.lineTo(size.width * 0.56, size.height);
    path.lineTo(size.width * 0.46, size.height);
    path.lineTo(size.width * 0.46, size.height * 0.05);
    path.lineTo(size.width * 0.39, size.height * 0.05);
    path.lineTo(size.width * 0.39, size.height);
    path.lineTo(size.width * 0.28, size.height);
    path.lineTo(size.width * 0.28, size.height * 0.05);
    path.lineTo(size.width * 0.25, size.height * 0.05);
    path.lineTo(size.width * 0.23, size.height * 0.17);
    path.cubicTo(size.width * 0.23, size.height * 0.19, size.width * 0.23, size.height * 0.21, size.width * 0.22, size.height * 0.22);
    path.lineTo(size.width * 0.1, size.height * 0.22);
    path.lineTo(size.width * 0.1, size.height * 0.42);
    path.lineTo(size.width * 0.2, size.height * 0.42);
    path.lineTo(size.width * 0.18, size.height * 0.64);
    path.lineTo(size.width * 0.1, size.height * 0.64);
    path.lineTo(size.width * 0.1, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.lineTo(0, 0);
    path.moveTo(size.width * 0.87, size.height * 0.67);
    path.lineTo(size.width * 0.83, size.height * 0.26);
    path.lineTo(size.width * 0.83, size.height * 0.26);
    path.lineTo(size.width * 0.79, size.height * 0.67);
    path.lineTo(size.width * 0.87, size.height * 0.67);
    path.lineTo(size.width * 0.87, size.height * 0.67);
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
hei ght: Get.height,
child: AnimatedOpacity(
opacity: _visible ? 1.0 : 0.0,
duration: const Duration(milliseconds: 1000),
child: VideoPlayer(_controller),
),
),
), */