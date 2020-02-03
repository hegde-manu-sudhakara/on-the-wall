// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE_bsd file.

// Copyright 2020 Manu S Hegde
// Modified to draw-out the hand, based on type of hand
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License that
// can be found in the LICENSE file.

import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../model/clock/hand.dart';

/// A clock hand that is drawn with [CustomPainter]
///
/// The hand's length scales based on the clock's size.
/// This hand is used to build the second and minute hands, and demonstrates
/// building a custom hand.
class DrawnHand extends Hand {
  /// Create a const clock [Hand].
  const DrawnHand(
      {@required HandType type,
      @required Color color,
      @required this.thickness,
      @required double size,
      @required double angleRadians,
      this.offCenter})
      : assert(color != null),
        assert(thickness != null),
        assert(size != null),
        assert(angleRadians != null),
        super(
            type: type,
            color: color,
            size: size,
            angleRadians: angleRadians,
            offCenter: offCenter);

  /// How thick the hand should be drawn, in logical pixels.
  final double thickness;

  /// Offset of the center
  final Offset offCenter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.expand(
        child: CustomPaint(
          painter: _HandPainter(
              screenSize: MediaQuery.of(context).size,
              type: type,
              handSize: size,
              lineWidth: thickness,
              angleRadians: angleRadians,
              color: color,
              offCenter: offCenter),
        ),
      ),
    );
  }
}

/// [CustomPainter] that draws a clock hand.
class _HandPainter extends CustomPainter {
  _HandPainter(
      {@required this.screenSize,
      @required this.type,
      @required this.handSize,
      @required this.lineWidth,
      @required this.angleRadians,
      @required this.color,
      this.offCenter})
      : assert(handSize != null),
        assert(lineWidth != null),
        assert(angleRadians != null),
        assert(color != null),
        assert(handSize >= 0.0),
        assert(handSize <= 1.0);

  HandType type;

  Size screenSize;
  Offset offCenter;
  double handSize;
  double lineWidth;
  double angleRadians;
  Color color;

  get _center => offCenter ?? Offset.zero;

  @override
  void paint(Canvas canvas, Size size) {
    double m = screenSize.width * screenSize.height / 900000;

    final center = (_center & size).center;
    // We want to start at the top, not at the x-axis, so add pi/2.
    final angle = angleRadians - math.pi / 2.0;
    final length = size.shortestSide * 0.5 * handSize * m;
    final position = center +
        Offset(math.cos(angle), math.sin(angle)) *
            ((type == HandType.Minute
                    ? 12
                    : (type == HandType.Hour ? 16 : 200)) *
                lineWidth *
                m);
    final linePaint = Paint()
      ..color = color
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.square;

    //canvas.drawLine(center, position, linePaint);

    final angle1 = angleRadians - math.pi / 2.0 + getAngleWidth(type) / 2;
    final angle2 = angleRadians - math.pi / 2.0 - getAngleWidth(type) / 2;

    final angle3 = angleRadians - math.pi / 2.0 + getAngleWidth(type) / 500;
    final angle4 = angleRadians - math.pi / 2.0 - getAngleWidth(type) / 500;
    final length1 = length / 2;

    final position1 =
        center + Offset(math.cos(angle1), math.sin(angle1)) * length1;
    final position2 =
        center + Offset(math.cos(angle2), math.sin(angle2)) * length1;

    final position3 = center +
        Offset(math.cos(angle1), math.sin(angle1)) * (14 * lineWidth) * m;
    final position4 = center +
        Offset(math.cos(angle2), math.sin(angle2)) * (14 * lineWidth) * m;

    final center1 = center -
        Offset(math.cos(angle3), math.sin(angle3)) * 10 / getAngleWidth(type);
    final center2 = center -
        Offset(math.cos(angle4), math.sin(angle4)) * 10 / getAngleWidth(type);

    Path handBg = Path()
      ..moveTo(center2.dx, center2.dy)
      ..lineTo(center1.dx, center1.dy)
      ..lineTo(position1.dx, position1.dy)
      ..lineTo(position.dx, position.dy)
      ..lineTo(position2.dx, position2.dy);

    canvas.drawPath(handBg, Paint()..color = Colors.black12);

    Path hand = Path()
      ..moveTo(center.dx, center.dy)
      ..lineTo(position3.dx, position3.dy)
      ..lineTo(position.dx, position.dy)
      ..lineTo(position4.dx, position4.dy);

    canvas.drawPath(hand, linePaint);
  }

  @override
  bool shouldRepaint(_HandPainter oldDelegate) {
    return oldDelegate.handSize != handSize ||
        oldDelegate.lineWidth != lineWidth ||
        oldDelegate.angleRadians != angleRadians ||
        oldDelegate.color != color;
  }

  double getAngleWidth(HandType handType) {
    switch (handType) {
      case HandType.Hour:
        return math.pi / 12;

      case HandType.Minute:
        return math.pi / 18;

      case HandType.Second:
        return math.pi / 36;
    }
    return -1;
  }
}
