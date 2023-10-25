
import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:irecipe/starter.dart';

Future<void> main(List<String> args) async {
  Flavor.create(
    // TODO : Add your own flavor values
    Environment.production,
    name: "Production",
    color: Colors.blue,
  );
  launchApp();
}
