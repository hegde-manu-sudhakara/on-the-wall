// Copyright 2020 Manu S Hegde
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License that
// can be found in the LICENSE file.

import 'dart:math';

import '../model/thing.dart';

class Lights {
  List<Thing> _switchedOn;
  List<Thing> _switchedOff;
  List<int> randomValues;

  static String path = "lights/";

  static const BRIGHTNESS_LEVELS = 5;

  Lights() {
    if (_switchedOn == null || _switchedOff == null) {
      init();
    }
  }

  init() {
    _switchedOn = List();
    _switchedOff = List();
  }

  void computeRandomValues() {
    final lightCount = max(_switchedOn.length, _switchedOff.length);

    List<int> shuffledIndex = List.generate(lightCount, (index) => index);
    shuffledIndex.shuffle();

    randomValues =
        List.generate(24, (index) => shuffledIndex[index % lightCount]);
  }

  List<Thing> get switchedOn {
    return _switchedOn;
  }

  List<Thing> get switchedOff {
    return _switchedOff;
  }

  List<Thing> getLightAvailableAt(DateTime now, {bool isSwitchedOn}) {
    List<Thing> lights = [];
    lights.addAll(getBrightness(switchedOn: isSwitchedOn));
    lights
        .add((isSwitchedOn ? switchedOn : switchedOff)[randomValues[now.hour]]);
    lights.add(getWiring());

    return lights;
  }

  Thing getWiring() {
    return Thing(
      name: "wiring",
      filename: "knot.svg",
      width: 200.0,
      offBottom: 520.0,
    );
  }

  List<Thing> getBrightness({bool switchedOn = false}) {
    const SPOT_SIZE = 300.0;
    const SPOT_SIZE_INCREMENT = 100.0;

    const SPOT_OFF_RIGHT = 75.0;
    const SPOT_OFF_BOTTOM = 140.0;

    final spotOpacity = switchedOn ? 0.25 : 0.2;

    return List.generate(
        BRIGHTNESS_LEVELS,
        (index) => Thing(
              name: "white",
              filename: "white_disc.svg",
              width: SPOT_SIZE + index * (SPOT_SIZE + SPOT_SIZE_INCREMENT),
              offRight: 2 * SPOT_OFF_RIGHT - index * SPOT_OFF_RIGHT,
              offBottom: 2 * SPOT_OFF_BOTTOM - index * SPOT_OFF_BOTTOM,
              opacity: spotOpacity,
            ));
  }

  add(Thing thing) {
    switch (thing.status) {
      case LightStatus.on:
        switchedOn.add(thing);
        break;
      case LightStatus.off:
        switchedOff.add(thing);
        break;
    }
  }
}

enum Light { ball, bulb, cfl, flicker }

enum LightStatus { on, off }
