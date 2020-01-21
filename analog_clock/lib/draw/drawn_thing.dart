// Copyright 2020 Manu S Hegde
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License that
// can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../model/thing.dart';

class DrawnThing {
  static Widget getWidget(Thing thing) {
    return Positioned(
        right: thing.offRight,
        bottom: thing.offBottom,
        child: Transform.rotate(
          angle: thing.rotateAtAngle,
          child: Opacity(
            opacity: thing.opacity,
            child: SvgPicture.asset(
              '${Thing.path}${thing.filename}',
              width: thing.width,
            ),
          ),
        ));
  }

  static Widget getWidgetAtPosition(Thing thing, double offRight) {
    return Positioned(
        right: offRight,
        bottom: thing.offBottom,
        child: Opacity(
          opacity: thing.opacity,
          child: SvgPicture.asset(
            '${Thing.path}${thing.filename}',
            width: thing.width,
          ),
        ));
  }

  static List<Widget> getWidgets(List<Thing> things) {
    return things.map((Thing thing) => DrawnThing.getWidget(thing)).toList();
  }

  static List<Widget> getWidgetsSpacedApart(List<Thing> things) {
    double previousItemWidth = 0.0;
    double previousItemPosition = 0.0;

    double spacer = 25;

    return things.map((Thing thing) {
      double offRight = previousItemWidth + previousItemPosition;

      previousItemWidth = thing.width;
      previousItemPosition = thing.offRight / 8 + offRight;

      return DrawnThing.getWidgetAtPosition(thing, offRight + spacer);
    }).toList();
  }
}
