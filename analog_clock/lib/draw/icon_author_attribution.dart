// Copyright 2020 Manu S Hegde
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License that
// can be found in the LICENSE file.

import 'package:flutter/material.dart';

class IconAuthorAttribution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double m = screenSize.width * screenSize.height / 700000;

    return Positioned(
        right: 25 * m,
        top: 50 * m,
        child: FlatButton(
            onPressed: null,
            child: Center(
                child: Text(
              'Icons made by\nFreepik\n\nfrom\nwww.flaticon.com',
              style: TextStyle(fontSize: 16.0 * m, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ))));
  }
}
