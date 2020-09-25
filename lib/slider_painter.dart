import 'package:flutter/material.dart';

class SliderPainter extends CustomPainter {
  final Offset kc1Position;
  final Offset kc2Position;
  final Size kc1Size;
  final Size kc2Size;
  final Color sliderColor;
  final Color selectedSliderColor;

  SliderPainter(
      {this.kc1Position,
      this.kc1Size,
      this.kc2Size,
      this.kc2Position,
      this.selectedSliderColor,
      this.sliderColor});

  _drawKC2Curve(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    Path path = Path();
    Path path2 = Path();

    if (kc1Position.dx > kc1Size.width * 1.5) {
      path.moveTo(kc1Size.width, height / 2);
      path.lineTo(kc1Position.dx - kc1Size.width, height / 2);
      // left side bottom curve
      path.quadraticBezierTo(kc1Position.dx - (kc1Size.width / 2), height / 2,
          kc1Position.dx - (kc1Size.width / 4), height / 2 - 8);
    } else {
      path.moveTo(kc1Position.dx - (kc1Size.width / 4), height / 2 - 8);
    }

    if (kc1Position.dx > kc1Size.width) {
      //left side top curve
      path.quadraticBezierTo(
          kc1Position.dx,
          height / 2 - kc1Size.height + 10,
          kc1Position.dx + (kc1Size.width / 2),
          height / 2 - (kc1Size.height - 10));
    } else {
      path.moveTo(kc1Position.dx + (kc1Size.width / 2),
          height / 2 - (kc1Size.height - 10));
    }

    // right side curve top
    if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 30) {
      path.quadraticBezierTo(
          kc1Position.dx + kc1Size.width,
          height / 2 - kc1Size.height + 10,
          kc1Position.dx + kc1Size.width + 10,
          height / 2 - 8);
    } else {
      path.lineTo(kc2Position.dx + (kc2Size.width / 2),
          height / 2 - (kc2Size.height - 10));
    }

    // right side curve down
    if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 70) {
      path.quadraticBezierTo(kc1Position.dx + kc1Size.width * 1.5, height / 2,
          kc1Position.dx + kc1Size.width * 2, height / 2);
    } else if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 45) {
      path.quadraticBezierTo(kc1Position.dx + kc1Size.width * 1.5, height / 2,
          kc1Position.dx + kc1Size.width * 2, height / 2);
    }

    ///kc2
    if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 90) {
      path.lineTo(kc2Position.dx - kc2Size.width, height / 2);
    }
    // left side bottom curve
    if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 30) {
      path.quadraticBezierTo(kc2Position.dx - (kc2Size.width / 2), height / 2,
          kc2Position.dx - (kc2Size.width / 4), height / 2 - 8);

      //left side top curve
      path.quadraticBezierTo(
          kc2Position.dx,
          height / 2 - kc2Size.height + 10,
          kc2Position.dx + (kc2Size.width / 2),
          height / 2 - (kc2Size.height - 10));
    }

    // right side curve top

    if (kc2Position.dx < width - (kc2Size.width * 1.5)) {
      path.quadraticBezierTo(
          kc2Position.dx + kc2Size.width,
          height / 2 - kc2Size.height + 10,
          kc2Position.dx + kc2Size.width + 10,
          height / 2 - 8);
    }

    // right side curve down

    if (kc2Position.dx < width - (kc2Size.width * 2.5)) {
      path.quadraticBezierTo(kc2Position.dx + kc2Size.width * 1.5, height / 2,
          kc2Position.dx + kc2Size.width * 2, height / 2);
      path.lineTo(width - kc2Size.width, height / 2);
    }

    ///path 2

    path2.moveTo(kc1Position.dx + (kc1Size.width / 2),
        height / 2 - (kc1Size.height - 10));
    // right side curve top
    if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 30) {
      path2.quadraticBezierTo(
          kc1Position.dx + kc1Size.width,
          height / 2 - kc1Size.height + 10,
          kc1Position.dx + kc1Size.width + 10,
          height / 2 - 8);
    } else {
      path2.lineTo(kc2Position.dx + (kc2Size.width / 2),
          height / 2 - (kc2Size.height - 10));
    }

    // right side curve down
    if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 70) {
      path2.quadraticBezierTo(kc1Position.dx + kc1Size.width * 1.5, height / 2,
          kc1Position.dx + kc1Size.width * 2, height / 2);
    } else if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 45) {
      path2.quadraticBezierTo(kc1Position.dx + kc1Size.width * 1.5, height / 2,
          kc1Position.dx + kc1Size.width * 2, height / 2);
    }

    ///kc2
    if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 90) {
      path2.lineTo(kc2Position.dx - kc2Size.width, height / 2);
    }
    // left side bottom curve
    if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 30) {
      path2.quadraticBezierTo(kc2Position.dx - (kc2Size.width / 2), height / 2,
          kc2Position.dx - (kc2Size.width / 4), height / 2 - 8);

      //left side top curve
      path2.quadraticBezierTo(
          kc2Position.dx,
          height / 2 - kc2Size.height + 10,
          kc2Position.dx + (kc2Size.width / 2),
          height / 2 - (kc2Size.height - 10));
    }

    canvas.drawPath(
        path,
        Paint()
          ..color = sliderColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5.0);

    canvas.drawPath(
        path2,
        Paint()
          ..color = selectedSliderColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5.0);
  }

  @override
  void paint(Canvas canvas, Size size) {
//    _drawKC1Curve(canvas, size);
    _drawKC2Curve(canvas, size);
//    canvas.drawCircle(Offset(kc1Position.dx - 5, size.height / 2), 23,
//        Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

//_drawKC1Curve(Canvas canvas, Size size) {
//  double width = size.width;
//  double height = size.height;
//  Path path = Path();
//  Path path2 = Path();
//
//  /// starting point...
//  if (kc1Position.dx > 60) {
//    path.moveTo(15.0, height / 2);
//  } else {
//    path.moveTo(kc1Position.dx - 15, height / 2 - 25);
//  }
//
//  /// line left side..
//  if (kc1Position.dx > 60) {
//    path.lineTo(kc1Position.dx - 40.0, height / 2);
//  }
//
//  /// kc1 curve left side...
//  if (kc1Position.dx > 60) {
//    path.quadraticBezierTo(
//        kc1Position.dx - 30, height / 2, kc1Position.dx - 30, height / 2 - 5);
//    path.quadraticBezierTo(
//        kc1Position.dx - 25, 25.0, kc1Position.dx - 5, height / 2 - 25);
//  }
//
//  /// kc1 curve right side...
//  if (kc1Position.dx < 322.0) {
//    path.quadraticBezierTo(
//        kc1Position.dx + 15, 25.0, kc1Position.dx + 20, height / 2 - 5);
//    path.quadraticBezierTo(
//        kc1Position.dx + 20, height / 2, kc1Position.dx + 25, height / 2);
//  }
//  path.lineTo(kc2Position.dx - 40, height / 2);
//
//  /// kc2 curve left side...
//  if (kc2Position.dx > 60) {
//    path.quadraticBezierTo(
//        kc2Position.dx - 30, height / 2, kc2Position.dx - 30, height / 2 - 5);
//    path.quadraticBezierTo(
//        kc2Position.dx - 25, 25.0, kc2Position.dx - 5, height / 2 - 25);
//  }
//
//  /// kc2 curve right side...
//  if (kc2Position.dx < 322.0) {
//    path.quadraticBezierTo(
//        kc2Position.dx + 15, 25.0, kc2Position.dx + 20, height / 2 - 5);
//    path.quadraticBezierTo(
//        kc2Position.dx + 20, height / 2, kc2Position.dx + 25, height / 2);
//  }
//
//  /// line right side..
//  if (kc2Position.dx < width - 30) {
//    path.lineTo(width - 15.0, height / 2);
//  }
//
//  /// path2
//
//  path2.moveTo(kc1Position.dx - 5, height / 2 - 25);
//
//  /// kc1 curve right side...
//  if (kc1Position.dx < 322.0) {
//    path2.quadraticBezierTo(
//        kc1Position.dx + 15, 25.0, kc1Position.dx + 20, height / 2 - 5);
//    path2.quadraticBezierTo(
//        kc1Position.dx + 20, height / 2, kc1Position.dx + 25, height / 2);
//  }
//  path2.lineTo(kc2Position.dx - 40, height / 2);
//
//  /// kc2 curve left side...
//  if (kc2Position.dx > 60) {
//    path2.quadraticBezierTo(
//        kc2Position.dx - 30, height / 2, kc2Position.dx - 30, height / 2 - 5);
//    path2.quadraticBezierTo(
//        kc2Position.dx - 25, 25.0, kc2Position.dx - 5, height / 2 - 25);
//  }
//
//  canvas.drawPath(
//      path,
//      Paint()
//        ..color = Colors.grey[300]
//        ..style = PaintingStyle.stroke
//        ..strokeWidth = 5.0);
//  canvas.drawPath(
//      path2,
//      Paint()
//        ..color = Colors.blue
//        ..style = PaintingStyle.stroke
//        ..strokeWidth = 5.0);
//}
