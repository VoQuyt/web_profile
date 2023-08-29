import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const int _kIndeterminateLinearDuration = 1800;

class LinerProgress extends StatelessWidget {
  const LinerProgress({
    super.key,
    this.backgroundColor = Colors.grey,
    this.valueColor = Colors.grey,
    this.value = 1,
    this.minHeight = 1,
  });

  final Color backgroundColor;
  final Color valueColor;
  final double value;
  final double minHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: minHeight,
      ),
      child: CustomPaint(
        painter: _LinerDraw(
          backgroundColor: backgroundColor,
          valueColor: valueColor,
          value: value, // may be null
          animationValue: value, // ignored if widget.value is not null
          textDirection: Directionality.of(context),
        ),
      ),
    );
  }
}

class _LinerDraw extends CustomPainter {
  const _LinerDraw({
    required this.backgroundColor,
    required this.valueColor,
    this.value,
    required this.animationValue,
    required this.textDirection,
  });

  final Color backgroundColor;
  final Color valueColor;
  final double? value;
  final double animationValue;
  final TextDirection textDirection;

  // The indeterminate progress animation displays two lines whose leading (head)
  // and trailing (tail) endpoints are defined by the following four curves.
  static const Curve line1Head = Interval(
    0.0,
    750.0 / _kIndeterminateLinearDuration,
    curve: Cubic(0.2, 0.0, 0.8, 1.0),
  );
  static const Curve line1Tail = Interval(
    333.0 / _kIndeterminateLinearDuration,
    (333.0 + 750.0) / _kIndeterminateLinearDuration,
    curve: Cubic(0.4, 0.0, 1.0, 1.0),
  );
  static const Curve line2Head = Interval(
    1000.0 / _kIndeterminateLinearDuration,
    (1000.0 + 567.0) / _kIndeterminateLinearDuration,
    curve: Cubic(0.0, 0.0, 0.65, 1.0),
  );
  static const Curve line2Tail = Interval(
    1267.0 / _kIndeterminateLinearDuration,
    (1267.0 + 533.0) / _kIndeterminateLinearDuration,
    curve: Cubic(0.10, 0.0, 0.45, 1.0),
  );

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawRect(Offset.zero & size, paint);

    paint.color = valueColor;

    void drawBar(double x, double width) {
      if (width <= 0.0) {
        return;
      }

      final double left;
      switch (textDirection) {
        case TextDirection.rtl:
          left = size.width - width - x;
        case TextDirection.ltr:
          left = x;
      }
      canvas.drawRect(Offset(left, 0.0) & Size(width, size.height), paint);
    }

    if (value != null) {
      drawBar(0.0, clampDouble(value!, 0.0, 1.0) * size.width);
    } else {
      final double x1 = size.width * line1Tail.transform(animationValue);
      final double width1 =
          size.width * line1Head.transform(animationValue) - x1;

      final double x2 = size.width * line2Tail.transform(animationValue);
      final double width2 =
          size.width * line2Head.transform(animationValue) - x2;

      drawBar(x1, width1);
      drawBar(x2, width2);
    }
  }

  @override
  bool shouldRepaint(_LinerDraw oldDelegate) {
    return oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.valueColor != valueColor ||
        oldDelegate.value != value ||
        oldDelegate.animationValue != animationValue ||
        oldDelegate.textDirection != textDirection;
  }
}
