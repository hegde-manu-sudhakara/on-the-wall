// Copyright 2020 Manu S Hegde
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License that
// can be found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';

import '../../model/clock/face.dart';

/// A clock face that is drawn with [CustomPainter]
///
class DrawnFace extends Face {
  /// Create a const clock [Face].
  const DrawnFace(
      {@required accentColor,
      @required focusColor,
      @required markingColor,
      this.offCenter})
      : assert(accentColor != null),
        super(
            accentColor: accentColor,
            focusColor: focusColor,
            markingColor: markingColor,
            offCenter: offCenter);

  /// Offset of the center
  final Offset offCenter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.expand(
        child: CustomPaint(
          painter: _FacePainter(
              accentColor: accentColor,
              focusColor: focusColor,
              markingColor: markingColor,
              offCenter: offCenter),
        ),
      ),
    );
  }
}

/// [CustomPainter] that draws a clock hand.
class _FacePainter extends CustomPainter {
  _FacePainter(
      {@required this.accentColor,
      @required this.focusColor,
      @required this.markingColor,
      this.offCenter})
      : assert(accentColor != null);

  Offset offCenter;
  Color accentColor;
  Color focusColor;
  Color markingColor;

  get _center => offCenter ?? Offset.zero;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = (_center & size).center;

    final focusPaint = Paint()
      ..color = focusColor
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    final accentPaint = Paint()
      ..color = accentColor
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.square;

    final markingPaint = Paint()
      ..color = markingColor
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, 20, markingPaint);
    canvas.drawCircle(center, 10, accentPaint);

    canvas.drawCircle(center, 300, markingPaint);
    canvas.drawCircle(center, 295, focusPaint);

    //draw grid
/*    canvas.drawLine(Offset(center.dx-300, center.dy), Offset(center.dx+300, center.dy), Paint());
    canvas.drawLine(Offset(center.dx, center.dy-300), Offset(center.dx, center.dy+300), Paint());

    canvas.drawLine(Offset(center.dx - 600, size.shortestSide - 22),
        Offset(center.dx + 900, size.shortestSide - 22), Paint());
 */

    ///////// DRAWING MARKINGS ///////

    double angleRadians = 0.0;
    double angle;
    Offset position1, position2;
    double minAngle = pi / 30.0;

    for (int i = 0; i < 12; i++) {
      // We want to start at the top, not at the x-axis, so add pi/2.

      angle = angleRadians - pi / 2.0 + i * pi / 6.0;

      position1 = center + Offset(cos(angle), sin(angle)) * 250;
      position2 = center + Offset(cos(angle), sin(angle)) * 280;

      if (i != 0) {
        canvas.drawLine(position1, position2, accentPaint);
      }

      //   if (i > 0 && i < 11)
      for (int j = 1; j < 5; j++) {
        position1 = center +
            Offset(cos(angle + j * minAngle), sin(angle + j * minAngle)) *
                ((i == 0 || i == 11) ? 180 : 250);
        position2 = center +
            Offset(cos(angle + j * minAngle), sin(angle + j * minAngle)) *
                ((i == 0 || i == 11) ? 160 : 280);

        canvas.drawLine(position1, position2, markingPaint..strokeWidth = 2);
      }
    }

    canvas.drawCircle(
        center, 260, focusPaint..color = focusColor.withOpacity(0.65));
    drawNumbers(canvas, markingPaint, center);
  }

  @override
  bool shouldRepaint(_FacePainter oldDelegate) {
    return oldDelegate.accentColor != accentColor ||
        oldDelegate.focusColor != focusColor ||
        oldDelegate.markingColor != markingColor;
  }

  void drawNumbers(Canvas canvas, Paint paint, Offset center) {
    Offset markerPos = Offset(center.dx - 70 / 2, center.dy - 280);

    Path xii = Path()
      ..moveTo(markerPos.dx, markerPos.dy)
      ..lineTo(markerPos.dx + 30, markerPos.dy + 70)
      ..lineTo(markerPos.dx + 40, markerPos.dy + 70)
      ..lineTo(markerPos.dx + 10, markerPos.dy)
      //
      ..moveTo(markerPos.dx + 30, markerPos.dy)
      ..lineTo(markerPos.dx, markerPos.dy + 70)
      ..lineTo(markerPos.dx + 10, markerPos.dy + 70)
      ..lineTo(markerPos.dx + 40, markerPos.dy)
      //
      ..moveTo(markerPos.dx + 45, markerPos.dy)
      ..lineTo(markerPos.dx + 45, markerPos.dy + 70)
      ..lineTo(markerPos.dx + 55, markerPos.dy + 70)
      ..lineTo(markerPos.dx + 55, markerPos.dy)
      //
      ..moveTo(markerPos.dx + 60, markerPos.dy)
      ..lineTo(markerPos.dx + 60, markerPos.dy + 70)
      ..lineTo(markerPos.dx + 70, markerPos.dy + 70)
      ..lineTo(markerPos.dx + 70, markerPos.dy);

    canvas.drawPath(xii, paint);
    canvas.drawShadow(xii, Colors.blue, 5, true);
  }
}
