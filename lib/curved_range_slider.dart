library curved_range_slider;

import 'package:curved_range_slider/slider_painter.dart';
import 'package:flutter/material.dart';

typedef OnValueChange(
  double firstValue,
  double secondValue,
  double rangeValue,
  Offset firstPosition,
  Offset secondPosition,
  bool isFirstDragged,
);

class CurvedSlider extends StatefulWidget {
  final Size screenSize;
  final OnValueChange onChanged;
  final double sliderRange;
  final Color iconColor;
  final Color sliderColor;
  final Color selectedSliderColor;
  final Color buttonColor;

  const CurvedSlider({
    @required this.screenSize,
    this.onChanged,
    this.sliderRange = 100.0,
    this.iconColor = Colors.black,
    this.buttonColor = Colors.blue,
    this.selectedSliderColor = Colors.blue,
    this.sliderColor = Colors.grey,
  });

  @override
  _CurvedSliderState createState() => _CurvedSliderState(screenSize);
}

class _CurvedSliderState extends State<CurvedSlider> {
  final Size screenSize;

  /// _sliderCircleKey....
  GlobalKey _kC1 = GlobalKey();
  GlobalKey _kC2 = GlobalKey();

  /// _sliderCircleSize....
  Size kC1Size = Size(30, 30);
  Size kC2Size = Size(30, 30);

  /// _sliderCircleInitialPosition...
  double kC1Position = 15.0;
  double kC2Position = 100.0;

  /// _sliderCircleInitialRenderedPosition...
  Offset kC1RenderPosition = Offset(15, 0);
  Offset kC2RenderPosition = Offset(100, 0);

  /// _sliderCircleTopPadding....
  double buttonTopPadding = 15.0;

  _CurvedSliderState(this.screenSize);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: screenSize.width,
      child: Stack(
        children: [
          CustomPaint(
            painter: SliderPainter(
                kc1Position: kC1RenderPosition,
                kc1Size: kC1Size,
                kc2Size: kC2Size,
                kc2Position: kC2RenderPosition,
                selectedSliderColor: widget.selectedSliderColor,
                sliderColor: widget.sliderColor),
            child: Center(),
          ),
          Positioned(
            left: kC1Position,
            top: buttonTopPadding,
            child: GestureDetector(
              onHorizontalDragUpdate: (horizontalDragValue) {
                double position = 20.0;
                if (horizontalDragValue.globalPosition.dx <=
                    kC2Position - kC2Size.width) {
                  if (horizontalDragValue.globalPosition.dx <=
                      (kC1Size.width / 2)) {
                    position = (kC1Size.width / 2);
                    setState(() {
                      kC1Position = position;
                    });
                  } else if (horizontalDragValue.globalPosition.dx >
                      screenSize.width - (kC1Size.width * 2)) {
                    position = screenSize.width - (kC1Size.width * 2);
                    setState(() {
                      kC1Position = position;
                    });
                  } else {
                    position = horizontalDragValue.globalPosition.dx;
                    setState(() {
                      kC1Position = position;
                    });
                  }
                }
                kC1RenderPosition = Offset(kC1Position, 0.0);

                double total, first, second;
                total = ((((kC2RenderPosition.dx) - (kC1RenderPosition.dx)) /
                        (screenSize.width - (kC1Size.width + kC2Size.width))) *
                    widget.sliderRange);

                first = (((kC1RenderPosition.dx - (kC1Size.width / 2)) /
                        (screenSize.width - (kC1Size.width + kC2Size.width))) *
                    widget.sliderRange);

                second = (((kC2RenderPosition.dx - (kC2Size.width / 2)) /
                        (screenSize.width - (kC1Size.width + kC2Size.width))) *
                    widget.sliderRange);

                widget.onChanged(first, second, total, kC1RenderPosition,
                    kC2RenderPosition, true);
              },
              child: Container(
                key: _kC1,
                width: kC1Size.width,
                height: kC1Size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(color: widget.buttonColor, width: 2.0),
                ),
                alignment: Alignment.center,
                child: Icon(Icons.arrow_left, color: widget.iconColor),
              ),
            ),
          ),
          Positioned(
            left: kC2Position,
            top: buttonTopPadding,
            child: GestureDetector(
              onHorizontalDragUpdate: (horizontalDragValue) {
                double position = 20.0;
                if (horizontalDragValue.globalPosition.dx >=
                    kC1Position + kC1Size.width) {
                  if (horizontalDragValue.globalPosition.dx < 20.0) {
                    position = 20.0;
                    setState(() {
                      kC2Position = position;
                    });
                  } else if (horizontalDragValue.globalPosition.dx >
                      screenSize.width - (kC2Size.width * 1.5)) {
                    position = screenSize.width - (kC2Size.width * 1.5);
                    setState(() {
                      kC2Position = position;
                    });
                  } else {
                    position = horizontalDragValue.globalPosition.dx;
                    setState(() {
                      kC2Position = position;
                    });
                  }
                }

                kC2RenderPosition = Offset(kC2Position, 0.0);

                double total, first, second;
                total = ((((kC2RenderPosition.dx) - (kC1RenderPosition.dx)) /
                        (screenSize.width - (kC1Size.width + kC2Size.width))) *
                    widget.sliderRange);

                first = (((kC1RenderPosition.dx - (kC1Size.width / 2)) /
                        (screenSize.width - (kC1Size.width + kC2Size.width))) *
                    widget.sliderRange);

                second = (((kC2RenderPosition.dx - (kC2Size.width / 2)) /
                        (screenSize.width - (kC1Size.width + kC2Size.width))) *
                    widget.sliderRange);
                widget.onChanged(first, second, total, kC1RenderPosition,
                    kC2RenderPosition, false);
              },
              child: Container(
                key: _kC2,
                width: kC2Size.width,
                height: kC2Size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(color: widget.buttonColor, width: 2.0),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_right,
                  color: widget.iconColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
