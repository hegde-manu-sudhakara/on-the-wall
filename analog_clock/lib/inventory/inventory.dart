// Copyright 2020 Manu S Hegde
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License that
// can be found in the LICENSE file.

import 'package:flutter/material.dart';

import '../model/edibles.dart';
import '../model/lights.dart';
import '../model/thing.dart';

import '../model/tray.dart';
import 'populate.dart';
import 'inventory_actionable.dart';

class InventoryManager extends Populate implements InventoryActionable {
  static final InventoryManager _instance = InventoryManager._internal();

  InventoryManager._internal();

  static InventoryActionable get inventory => _instance;

  Edibles _edibles;
  Lights _lights;
  Tray _tray;

  Edibles get edibles {
    if (_edibles == null) {
      _edibles = Edibles();
      populateEdibles();
      _edibles.computeRandomValues();
    }
    return _edibles;
  }

  Lights get lights {
    if (_lights == null) {
      _lights = Lights();
      populateLights();
      _lights.computeRandomValues();
    }
    return _lights;
  }

  Tray get tray {
    if (_tray == null) {
      _tray = Tray();
    }
    return _tray;
  }

  @override
  List<Thing> getEdiblesAvailableAt(DateTime now) {
    return edibles.getAvailableAt(now);
  }

  @override
  List<Thing> getLightAvailableAt(DateTime now, {bool isSwitchedOn}) {
    return lights.getLightAvailableAt(now, isSwitchedOn: isSwitchedOn);
  }

  @override
  List<Thing> getTray() {
    return tray.tray;
  }

  @override
  void addEdible({@required Thing thing}) {
    edibles.add(thing);
  }

  @override
  void addLight({
    @required Thing thing,
  }) {
    lights.add(thing);
  }
}
