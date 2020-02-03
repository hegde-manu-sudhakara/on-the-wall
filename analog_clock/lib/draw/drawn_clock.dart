// Copyright 2020 Manu S Hegde
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License that
// can be found in the LICENSE file.

import 'package:analog_clock/draw/icon_author_attribution.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

import '../model/clock/hand.dart';
import 'clock/drawn_face.dart';
import 'clock/drawn_hand.dart';

class DrawnClock {
  final ThemeData theme;
  final Offset offCenter;
  final DateTime _now;

  /// Total distance traveled by a second or a minute hand, each second or minute,
  /// respectively.
  final radiansPerTick = radians(360 / 60);

  /// Total distance traveled by an hour hand, each hour, in radians.
  final radiansPerHour = radians(360 / 12);

  DrawnClock(this.theme, this.offCenter, this._now);

  List<Widget> get clock {
    return [
      DrawnFace(
        accentColor: theme.accentColor,
        focusColor: theme.focusColor,
        markingColor: theme.primaryColor,
        offCenter: offCenter,
      ),
      IconAuthorAttribution(),
      DrawnHand(
        type: HandType.Minute,
        color: theme.highlightColor.withOpacity(0.5),
        thickness: 16,
        size: 0.55,
        angleRadians: _now.minute * radiansPerTick,
        offCenter: offCenter,
      ),
      DrawnHand(
        type: HandType.Hour,
        color: theme.highlightColor,
        thickness: 8,
        size: 0.35,
        angleRadians:
            _now.hour * radiansPerHour + (_now.minute / 60) * radiansPerHour,
        offCenter: offCenter,
      ),
      DrawnHand(
        type: HandType.Second,
        color: theme.highlightColor,
        thickness: 1,
        size: 0.65,
        angleRadians: _now.second * radiansPerTick,
        offCenter: offCenter,
      ),
    ];
  }
}
