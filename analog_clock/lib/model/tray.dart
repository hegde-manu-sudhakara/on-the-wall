// Copyright 2020 Manu S Hegde
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License that
// can be found in the LICENSE file.

import 'thing.dart';

class Tray {
  List<Thing> get tray {
    return List.generate(
        20,
        (index) => Thing(
              name: "tray",
              filename: "wood.svg",
              width: 100.0,
              offRight: -400.0,
              offBottom: -70.0,
              opacity: 1,
            ));
  }
}
