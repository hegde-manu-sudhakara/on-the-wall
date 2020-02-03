import 'dart:math';

import 'package:analog_clock/model/edibles.dart';
import '../model/lights.dart';
import '../model/thing.dart';

import 'inventory.dart';

class Populate {
  void populateEdibles() {
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.beer,
      filename: "beer.svg",
      width: 200.0,
      offBottom: 22.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.berryCake,
      filename: "berry_cake.svg",
      width: 200.0,
      offBottom: 22.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.berryJam,
      filename: "berry_jam.svg",
      width: 200.0,
      offBottom: 22.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.birthdayCake,
      filename: "birthday_cake.svg",
      width: 200.0,
      offBottom: 22.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.bread,
      filename: "bread.svg",
      width: 200.0,
      offBottom: -18.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.breakfast,
      filename: "breakfast.svg",
      width: 200.0,
      offBottom: -18.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.burger,
      filename: "burger.svg",
      width: 200.0,
      offBottom: 22.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.cereals,
      filename: "cereals.svg",
      width: 200.0,
      offBottom: -5.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.chicken,
      filename: "chicken.svg",
      width: 200.0,
      offBottom: 22.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.coffee,
      filename: "coffee.svg",
      width: 200.0,
      offBottom: 14.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.iceCream_cup,
      filename: "cup_ice_cream.svg",
      width: 200.0,
      offBottom: 22.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.fish,
      filename: "fish.svg",
      width: 200.0,
      offBottom: -18.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.food,
      filename: "food.svg",
      width: 250.0,
      offBottom: 18.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.fried_chicken,
      filename: "fried_chicken.svg",
      width: 200.0,
      offBottom: 22.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.fruit_salad,
      filename: "fruit_salad.svg",
      width: 200.0,
      offBottom: 4.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.fruits,
      filename: "fruits.svg",
      width: 200.0,
      offBottom: 14.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.grilled,
      filename: "grilled.svg",
      width: 200.0,
      offBottom: -2.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.gudbud,
      filename: "gudbud.svg",
      width: 200.0,
      offBottom: 22.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.hot_chocolate,
      filename: "hot_chocolate.svg",
      width: 200.0,
      offBottom: 22.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.iceCream,
      filename: "ice_cream.svg",
      width: 200.0,
      offBottom: 22.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.iceCream_jug,
      filename: "jug_ice_cream.svg",
      width: 200.0,
      offBottom: 22.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.juicer,
      filename: "juicer.svg",
      width: 250.00,
      offBottom: 22.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.kettle,
      filename: "kettle.svg",
      width: 250.00,
      offBottom: 22.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.lunch,
      filename: "lunch.svg",
      width: 200.0,
      offBottom: 22.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.jam_mango,
      filename: "mango_jam.svg",
      width: 200.0,
      offBottom: 22.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.jam_marmalade,
      filename: "marmalade.svg",
      width: 200.0,
      offBottom: 22.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.milk_carton,
      filename: "milk_carton.svg",
      width: 200.0,
      offBottom: 22.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.milkshake,
      filename: "milkshake.svg",
      width: 200.0,
      offBottom: 22.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.juice_orange,
      filename: "orange_juice.svg",
      width: 200.0,
      offBottom: 22.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.iceCream_plate,
      filename: "plate_ice_cream.svg",
      width: 200.0,
      offBottom: 22.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.profiterole,
      filename: "profiterole.svg",
      width: 200.0,
      offBottom: -4.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.salad,
      filename: "salad.svg",
      width: 200.0,
      offBottom: -2.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.sandwich,
      filename: "sandwich.svg",
      width: 200.0,
      offBottom: -20.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.sandwich_large,
      filename: "sandwich_twin.svg",
      width: 200.0,
      offBottom: -2.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.snack,
      filename: "snack.svg",
      width: 200.0,
      offBottom: 20.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.jam_strawberry,
      filename: "strawberry_jam.svg",
      width: 200.0,
      offBottom: 22.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.supper,
      filename: "supper.svg",
      width: 200.0,
      offBottom: -20.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.tea,
      filename: "tea.svg",
      width: 200.0,
      offBottom: -12.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.teaPot,
      filename: "tea_pot.svg",
      width: 200.0,
      offBottom: 20.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.toaster,
      filename: "toaster.svg",
      width: 200.0,
      offBottom: 22.0,
    ));
    InventoryManager.inventory.addEdible(
        thing: Thing.asEdible(
      name: Edible.iceCream_unit,
      filename: "unit_ice_cream.svg",
      width: 200.0,
      offBottom: 22.0,
    ));
  }

  void populateLights() {
    InventoryManager.inventory.addLight(
        thing: Thing.asLight(
            name: Light.ball,
            filename: "ball_switched_on.svg",
            width: 200.0,
            offBottom: 330.0,
            status: LightStatus.on));

    InventoryManager.inventory.addLight(
        thing: Thing.asLight(
            name: Light.ball,
            filename: "ball_switched_off.svg",
            width: 200.0,
            offBottom: 330.0,
            status: LightStatus.off));
    InventoryManager.inventory.addLight(
        thing: Thing.asLight(
            name: Light.bulb,
            filename: "bulb_switched_on.svg",
            width: 200.0,
            offBottom: 330.0,
            status: LightStatus.on));

    InventoryManager.inventory.addLight(
        thing: Thing.asLight(
            name: Light.bulb,
            filename: "bulb_switched_off.svg",
            width: 200.0,
            offBottom: 330.0,
            status: LightStatus.off));

    InventoryManager.inventory.addLight(
        thing: Thing.asLight(
            name: Light.cfl,
            filename: "cfl_switched_on.svg",
            width: 200.0,
            offBottom: 330.0,
            rotateAtAngle: pi,
            status: LightStatus.on));

    InventoryManager.inventory.addLight(
        thing: Thing.asLight(
            name: Light.cfl,
            filename: "cfl_switched_off.svg",
            width: 200.0,
            offBottom: 330.0,
            rotateAtAngle: pi,
            status: LightStatus.off));

    InventoryManager.inventory.addLight(
        thing: Thing.asLight(
      name: Light.flicker,
      filename: "flicker_switched_on.svg",
      width: 200.0,
      offBottom: 330.0,
      rotateAtAngle: pi,
      status: LightStatus.on,
    ));

    InventoryManager.inventory.addLight(
        thing: Thing.asLight(
      name: Light.flicker,
      filename: "flicker_switched_off.svg",
      width: 200.0,
      offBottom: 330.0,
      rotateAtAngle: pi,
      status: LightStatus.off,
    ));
  }
}
