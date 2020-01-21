// Copyright 2020 Manu S Hegde
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License that
// can be found in the LICENSE file.

import 'package:flutter/foundation.dart';

import 'edibles.dart';
import 'lights.dart';

class Thing {
  Thing(
      {@required this.name,
      @required this.filename,
      @required this.width,
      @required this.offBottom,
      this.offRight = 200.0,
      this.rotateAtAngle = 0.0,
      this.opacity = 1.0,
      this.status});

  Thing.asEdible(
      {@required name,
      @required filename,
      @required width,
      @required offBottom,
      rotateAtAngle = 0.0,
      opacity})
      : this(
          name: name,
          filename: "${Edibles.path}$filename",
          width: width,
          offBottom: offBottom,
          rotateAtAngle: rotateAtAngle,
          opacity: opacity,
        );

  Thing.asLight(
      {@required name,
      @required filename,
      @required width,
      @required offBottom,
      rotateAtAngle = 0.0,
      status})
      : this(
            name: name,
            filename: "${Lights.path}$filename",
            width: width,
            offBottom: offBottom,
            rotateAtAngle: rotateAtAngle,
            status: status);

  final name;

  static String path = 'assets/inventory/';
  final String filename;

  final double opacity;

  final double width;

  final double offBottom;
  final double offRight;
  final double rotateAtAngle;

  final status;
}
