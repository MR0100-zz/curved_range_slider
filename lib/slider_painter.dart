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

    print("kc1 : ${kc1Position.dx}");
    print("kc2 : ${kc2Position.dx}");
    print("diff : ${kc2Position.dx - (kc1Position.dx + kc1Size.width)}");

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
    } else if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 20) {
      path.quadraticBezierTo(
          kc1Position.dx + kc1Size.width,
          height / 2 - kc1Size.height + 10,
          kc1Position.dx + kc1Size.width + 5,
          height / 2 - 12);
    } else {
      path.lineTo(kc2Position.dx + (kc2Size.width / 2),
          height / 2 - (kc2Size.height - 10));
    }

    // right side curve down
    if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 60) {
      path.quadraticBezierTo(kc1Position.dx + kc1Size.width * 1.5, height / 2,
          kc1Position.dx + kc1Size.width * 2, height / 2);
    } else if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 55) {
      path.quadraticBezierTo(kc1Position.dx + kc1Size.width * 1.5, height / 2,
          kc1Position.dx + kc1Size.width * 2, height / 2);
    } else if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 50) {
      path.quadraticBezierTo(kc1Position.dx + kc1Size.width * 1.5, height / 2,
          kc1Position.dx + kc1Size.width * 1.7, height / 2);
    }

    ///kc2
    if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 70) {
      path.lineTo(kc2Position.dx - kc2Size.width, height / 2);
    }
    if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 30) {
      // left side bottom curve
      path.quadraticBezierTo(kc2Position.dx - (kc2Size.width / 2), height / 2,
          kc2Position.dx - (kc2Size.width / 4), height / 2 - 8);

      //left side top curve
      path.quadraticBezierTo(
          kc2Position.dx,
          height / 2 - kc2Size.height + 10,
          kc2Position.dx + (kc2Size.width / 2),
          height / 2 - (kc2Size.height - 10));
    } else if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 20) {
      path.quadraticBezierTo(kc2Position.dx - (kc2Size.width / 3), height / 2,
          kc2Position.dx - (kc2Size.width / 8), height / 2 - 12);

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
    } else if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 20) {
      path2.quadraticBezierTo(
          kc1Position.dx + kc1Size.width,
          height / 2 - kc1Size.height + 10,
          kc1Position.dx + kc1Size.width + 5,
          height / 2 - 12);
    } else {
      path2.lineTo(kc2Position.dx + (kc2Size.width / 2),
          height / 2 - (kc2Size.height - 10));
    }

    // right side curve down
    if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 60) {
      path2.quadraticBezierTo(kc1Position.dx + kc1Size.width * 1.5, height / 2,
          kc1Position.dx + kc1Size.width * 2, height / 2);
    } else if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 55) {
      path2.quadraticBezierTo(kc1Position.dx + kc1Size.width * 1.5, height / 2,
          kc1Position.dx + kc1Size.width * 2, height / 2);
    } else if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 50) {
      path2.quadraticBezierTo(kc1Position.dx + kc1Size.width * 1.5, height / 2,
          kc1Position.dx + kc1Size.width * 1.7, height / 2);
    }

    ///kc2
    if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 70) {
      path2.lineTo(kc2Position.dx - kc2Size.width, height / 2);
    }
    if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 30) {
      // left side bottom curve
      path2.quadraticBezierTo(kc2Position.dx - (kc2Size.width / 2), height / 2,
          kc2Position.dx - (kc2Size.width / 4), height / 2 - 8);

      //left side top curve
      path2.quadraticBezierTo(
          kc2Position.dx,
          height / 2 - kc2Size.height + 10,
          kc2Position.dx + (kc2Size.width / 2),
          height / 2 - (kc2Size.height - 10));
    } else if ((kc2Position.dx - (kc1Position.dx + kc1Size.width)) > 20) {
      path2.quadraticBezierTo(kc2Position.dx - (kc2Size.width / 3), height / 2,
          kc2Position.dx - (kc2Size.width / 8), height / 2 - 12);

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
    _drawKC2Curve(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
