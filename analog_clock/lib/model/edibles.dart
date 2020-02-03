// Copyright 2020 Manu S Hegde
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License that
// can be found in the LICENSE file.

import 'dart:math';

import 'thing.dart';

class Edibles {
  List<Thing> _list;
  List<List<int>> randomValues;

  static String path = "edibles/";

  Edibles() {
    if (_list == null) {
      init();
    }
  }

  init() {
    _list = List();
  }

  void computeRandomValues() {
    int minCount = 2;
    int maxCount = 5;

    List<int> shuffledIndex = List.generate(_list.length, (index) => index);
    shuffledIndex.shuffle();

    randomValues = List.generate(
      24 * 60, // for each hour of the clock
      (index) {
        int count = minCount + Random().nextInt(maxCount - minCount);
        int start = Random().nextInt(_list.length - count);
        return shuffledIndex.sublist(start, start + count);
      },
    );
  }

  List<Thing> get list {
    return _list;
  }

  List<Thing> getAvailableAt(DateTime now) {
    int itemCount = 0;
    return randomValues[now.hour * 60 + now.minute].map(
      (index) {
        itemCount++;
        return Thing(
            name: _list[index].name,
            filename: _list[index].filename,
            width: _list[index].width,
            offBottom: _list[index].offBottom,
            opacity: itemCount <= 2 ? 1.0 : (itemCount <= 3 ? 0.7 : 0.5));
      },
    ).toList();
  }

  add(Thing thing) {
    list.add(thing);
  }
}

enum Edible {
  beer,
  berryCake,
  berryJam,
  birthdayCake,
  bread,
  breakfast,
  burger,
  cereals,
  chicken,
  coffee,
  iceCream_cup,
  fish,
  food,
  fried_chicken,
  fruit_salad,
  fruits,
  grilled,
  gudbud,
  hot_chocolate,
  iceCream,
  iceCream_jug,
  juicer,
  kettle,
  lunch,
  jam_mango,
  jam_marmalade,
  milk_carton,
  milkshake,
  juice_orange,
  iceCream_plate,
  profiterole,
  salad,
  sandwich,
  sandwich_large,
  snack,
  jam_strawberry,
  supper,
  tea,
  teaPot,
  toaster,
  iceCream_unit,
}
