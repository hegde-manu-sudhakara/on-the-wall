// Copyright 2020 Manu S Hegde
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License that
// can be found in the LICENSE file.

import 'package:flutter/material.dart';

/// A base class for an analog clock face-drawing widget.
///
/// This only draws the face of the analog clock.
abstract class Face extends StatelessWidget {
  /// Create a const clock [Face].
  ///
  /// All of the parameters are required and must not be null.
  const Face(
      {@required this.accentColor,
      @required this.focusColor,
      @required this.markingColor,
      this.offCenter})
      : assert(accentColor != null);

  /// Markings color.
  final Color accentColor;

  /// Focus color.
  final Color focusColor;

  /// Accent color.
  final Color markingColor;

  /// The offset of the origin
  final Offset offCenter;
}
