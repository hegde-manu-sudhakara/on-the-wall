// Copyright 2020 Manu S Hegde
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License that
// can be found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:intl/intl.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

import '../inventory//inventory.dart';
import 'drawn_clock.dart';
import 'drawn_thing.dart';

/// Total distance traveled by a second or a minute hand, each second or minute,
/// respectively.
final radiansPerTick = radians(360 / 60);

/// Total distance traveled by an hour hand, each hour, in radians.
final radiansPerHour = radians(360 / 12);

/// A basic analog clock.
///
/// I can do better than this!
class Scene extends StatefulWidget {
  const Scene();

  @override
  _SceneState createState() => _SceneState();
}

class _SceneState extends State<Scene> with SingleTickerProviderStateMixin {
  var _now = DateTime.now();
  Timer _timer;

  static const Offset offCenter = Offset(-241.5, 1.5);

  @override
  void initState() {
    super.initState();

    // Set the initial values.
    _updateTime();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      _now = DateTime.now();
      // Update once per second. Make sure to do it at the beginning of each
      // new second, so that the clock is accurate.
      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _now.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).brightness == Brightness.light
        ? Theme.of(context).copyWith(
            primaryColor: Colors.purple,
            focusColor: Colors.white,
            highlightColor: Colors.purple,
            accentColor: Colors.purple,
            backgroundColor: Colors.black38,
          )
        : Theme.of(context).copyWith(
            primaryColor: Colors.white,
            focusColor: Colors.purple,
            highlightColor: Colors.white,
            accentColor: Colors.white,
            backgroundColor: Colors.black87,
          );

    final time = DateFormat.Hms().format(DateTime.now());

    return Semantics.fromProperties(
      properties: SemanticsProperties(
        label: 'Analog clock with time $time',
        value: time,
      ),
      child: Container(
        color: customTheme.backgroundColor,
        child: Stack(
          children: getScreenComponents(
            customTheme,
          ),
        ),
      ),
    );
  }

  List<Widget> getScreenComponents(ThemeData theme, {Animation animation}) {
    List<Widget> components = []
      // adding the clock
      ..addAll(DrawnClock(theme, offCenter, _now, animation).clock)
      // adding the tray
      ..addAll(DrawnThing.getWidgetsSpacedApart(
          InventoryManager.inventory.getTray()))
      // adding the items
      ..addAll(DrawnThing.getWidgetsSpacedApart(
          InventoryManager.inventory.getEdiblesAvailableAt(DateTime.now())))
      // adding light(s)
      ..addAll(DrawnThing.getWidgets(InventoryManager.inventory
          .getLightAvailableAt(DateTime.now(),
              isSwitchedOn: Theme.of(context).brightness == Brightness.light
                  ? false
                  : true)));

    return components;
  }
}
