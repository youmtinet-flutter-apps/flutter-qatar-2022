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

class FIFAPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Path number 1
    path = Path();
    path.lineTo(0, 0);
    path.cubicTo(size.width * 0.1, 0, size.width * 0.19, 0, size.width * 0.29, 0);
    path.cubicTo(size.width * 0.27, size.height * 0.08, size.width * 0.26, size.height * 0.15, size.width / 4, size.height * 0.22);
    path.cubicTo(size.width / 5, size.height * 0.22, size.width * 0.15, size.height * 0.22, size.width * 0.11, size.height * 0.22);
    path.cubicTo(size.width * 0.11, size.height * 0.29, size.width * 0.11, size.height * 0.36, size.width * 0.11, size.height * 0.42);
    path.cubicTo(size.width * 0.14, size.height * 0.42, size.width * 0.17, size.height * 0.42, size.width / 5, size.height * 0.42);
    path.cubicTo(size.width / 4, size.height * 0.47, size.width * 0.27, size.height * 0.53, size.width * 0.27, size.height * 0.57);
    path.cubicTo(size.width * 0.27, size.height * 0.62, size.width * 0.23, size.height * 0.66, size.width * 0.18, size.height * 0.64);
    path.cubicTo(size.width * 0.15, size.height * 0.64, size.width * 0.13, size.height * 0.64, size.width * 0.11, size.height * 0.64);
    path.cubicTo(size.width * 0.11, size.height * 0.76, size.width * 0.11, size.height * 0.88, size.width * 0.11, size.height);
    path.cubicTo(size.width * 0.07, size.height, size.width * 0.04, size.height, 0, size.height);
    path.cubicTo(0, size.height * 0.67, 0, size.height * 0.34, 0, 0);
    path.cubicTo(0, 0, 0, 0, 0, 0);
    path.lineTo(size.width * 0.29, 0);
    path.cubicTo(size.width * 0.34, 0, size.width * 0.4, 0, size.width * 0.46, 0);
    path.cubicTo(size.width * 0.46, 0, size.width * 0.45, 0, size.width * 0.45, size.height * 0.01);
    path.cubicTo(size.width * 0.4, size.height * 0.06, size.width * 0.43, size.height * 0.55, size.width * 0.46, size.height);
    path.cubicTo(size.width * 0.34, size.height, size.width * 0.22, size.height, size.width * 0.1, size.height);
    path.cubicTo(size.width * 0.17, size.height * 1.02, size.width * 0.24, size.height * 0.95, size.width * 0.28, size.height * 0.79);
    path.cubicTo(size.width * 0.34, size.height * 0.58, size.width * 0.35, size.height * 0.26, size.width * 0.29, 0);
    path.cubicTo(size.width * 0.29, 0, size.width * 0.29, 0, size.width * 0.29, 0);
    path.lineTo(size.width * 0.46, 0);
    path.cubicTo(size.width * 0.56, 0, size.width * 0.67, 0, size.width * 0.78, 0);
    path.cubicTo(size.width * 0.76, size.height * 0.08, size.width * 0.74, size.height * 0.15, size.width * 0.72, size.height * 0.22);
    path.cubicTo(size.width * 0.67, size.height * 0.22, size.width * 0.62, size.height * 0.22, size.width * 0.56, size.height * 0.22);
    path.cubicTo(size.width * 0.56, size.height * 0.29, size.width * 0.56, size.height * 0.36, size.width * 0.56, size.height * 0.42);
    path.cubicTo(size.width * 0.59, size.height * 0.42, size.width * 0.63, size.height * 0.42, size.width * 0.66, size.height * 0.42);
    path.cubicTo(size.width * 0.68, size.height * 0.44, size.width * 0.7, size.height * 0.48, size.width * 0.71, size.height * 0.53);
    path.cubicTo(size.width * 0.72, size.height * 0.62, size.width * 0.72, size.height * 0.76, size.width * 0.7, size.height * 0.78);
    path.cubicTo(size.width * 0.68, size.height * 0.8, size.width * 0.65, size.height * 0.75, size.width * 0.63, size.height * 0.64);
    path.cubicTo(size.width * 0.61, size.height * 0.64, size.width * 0.59, size.height * 0.64, size.width * 0.56, size.height * 0.64);
    path.cubicTo(size.width * 0.56, size.height * 0.76, size.width * 0.56, size.height * 0.88, size.width * 0.56, size.height);
    path.cubicTo(size.width * 0.53, size.height, size.width * 0.49, size.height, size.width * 0.46, size.height);
    path.cubicTo(size.width * 0.46, size.height * 0.67, size.width * 0.46, size.height * 0.34, size.width * 0.46, 0);
    path.cubicTo(size.width * 0.46, 0, size.width * 0.46, 0, size.width * 0.46, 0);
    path.lineTo(size.width * 0.78, 0);
    path.cubicTo(size.width * 0.81, 0, size.width * 0.85, 0, size.width * 0.88, 0);
    path.cubicTo(size.width * 0.92, size.height * 0.34, size.width * 0.96, size.height * 0.67, size.width, size.height);
    path.cubicTo(size.width * 0.97, size.height, size.width * 0.93, size.height, size.width * 0.9, size.height);
    path.cubicTo(size.width * 0.89, size.height * 0.95, size.width * 0.89, size.height * 0.91, size.width * 0.89, size.height * 0.87);
    path.cubicTo(size.width * 0.85, size.height * 0.87, size.width * 0.81, size.height * 0.87, size.width * 0.77, size.height * 0.87);
    path.cubicTo(size.width * 0.77, size.height * 0.91, size.width * 0.76, size.height * 0.96, size.width * 0.76, size.height);
    path.cubicTo(size.width * 0.69, size.height, size.width * 0.63, size.height, size.width * 0.56, size.height);
    path.cubicTo(size.width * 0.63, size.height * 0.67, size.width * 0.71, size.height * 0.34, size.width * 0.78, 0);
    path.cubicTo(size.width * 0.78, 0, size.width * 0.78, 0, size.width * 0.78, 0);
    path.lineTo(size.width * 0.83, size.height * 0.26);
    path.cubicTo(size.width * 0.82, size.height * 0.4, size.width * 0.8, size.height * 0.54, size.width * 0.79, size.height * 0.67);
    path.cubicTo(size.width * 0.82, size.height * 0.67, size.width * 0.84, size.height * 0.68, size.width * 0.87, size.height * 0.68);
    path.cubicTo(size.width * 0.87, size.height * 0.67, size.width * 0.87, size.height * 0.67, size.width * 0.87, size.height * 0.67);
    path.cubicTo(size.width * 0.86, size.height * 0.54, size.width * 0.84, size.height * 0.4, size.width * 0.83, size.height * 0.26);
    path.cubicTo(size.width * 0.83, size.height * 0.26, size.width * 0.83, size.height * 0.26, size.width * 0.83, size.height * 0.26);

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