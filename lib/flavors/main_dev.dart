
import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irecipe/starter.dart';

Future<void> main(List<String> args) async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light,
  );

  Flavor.create(
    // TODO : Add your own flavor values
    Environment.dev,
    name: "Dev",
    color: Colors.green,
  );
  launchApp();
}
