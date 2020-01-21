// Copyright 2020 Manu S Hegde
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License that
// can be found in the LICENSE file.

import 'package:flutter/material.dart';

class IconAuthorAttribution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 50,
        top: 50,
        child: FlatButton(
            onPressed: null,
            child: Center(
                child: Text(
              'Icons made by\nFreepik\n\nfrom\nwww.flaticon.com',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ))));
  }
}
