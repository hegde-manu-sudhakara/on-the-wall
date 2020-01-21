// Copyright 2020 Manu S Hegde
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License that
// can be found in the LICENSE file.

import 'package:analog_clock/model/thing.dart';
import 'package:flutter/cupertino.dart';

abstract class InventoryActionable {
  List<Thing> getEdiblesAvailableAt(DateTime now);

  List<Thing> getLightAvailableAt(DateTime now, {bool isSwitchedOn});

  List<Thing> getTray();

  void addEdible({@required Thing thing});

  void addLight({@required Thing thing});
}
