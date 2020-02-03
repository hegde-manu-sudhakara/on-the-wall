// Copyright 2020 Manu S Hegde
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License that
// can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../model/thing.dart';

class DrawnThing {
  static Widget getWidget(double m, bool animate, Thing thing) {
    var child = /*Image.asset(
      '${Thing.path}${thing.filename}',
      width: thing.width * m,
      fit: BoxFit.fitWidth,
    )*/ SvgPicture.asset(
            '${Thing.path}${thing.filename}',
            width: thing.width,
          )
        ;

    return Positioned(
        right: thing.offRight * m,
        bottom: thing.offBottom * m,
        child: Transform.rotate(
          angle: thing.rotateAtAngle,
          child: animate
              ? AnimatedOpacity(
                  duration: Duration(seconds: 2),
                  curve: Curves.elasticIn,
                  opacity: getOpacity(animate, thing.opacity),
                  child: child,
                )
              : Opacity(
                  opacity: thing.opacity,
                  child: child,
                ),
        ));
  }

  static double getOpacity(bool animate, double opacity) {
    return animate ? 0.1 : opacity;
  }

  static Widget getWidgetAtPosition(
      double m, bool animate, Thing thing, double offRight) {
    var child = /*Image.asset(
      '${Thing.path}${thing.filename}',
      width: thing.width * m,
      fit: BoxFit.fitWidth,
    )*/ SvgPicture.asset(
            '${Thing.path}${thing.filename}',
            width: thing.width,
          )
        ;

    return Positioned(
        right: offRight * m,
        bottom: thing.offBottom * m,
        child: animate
            ? AnimatedOpacity(
                duration: Duration(seconds: 2),
                curve: Curves.easeIn,
                opacity: getOpacity(animate, thing.opacity),
                child: child,
              )
            : Opacity(
                opacity: thing.opacity,
                child: child,
              ));
  }

  static List<Widget> getWidgets(double m, bool animate, List<Thing> things) {
    return things
        .map((Thing thing) => DrawnThing.getWidget(m, animate, thing))
        .toList();
  }

  static List<Widget> getWidgetsSpacedApart(
      double m, bool animate, List<Thing> things) {
    double previousItemWidth = 0.0;
    double previousItemPosition = 0.0;

    double spacer = 25;

    return things.map((Thing thing) {
      double offRight = previousItemWidth + previousItemPosition;

      previousItemWidth = thing.width;
      previousItemPosition = thing.offRight / 8 + offRight;

      return DrawnThing.getWidgetAtPosition(
          m, animate, thing, offRight + spacer);
    }).toList();
  }
}
