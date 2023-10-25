import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irecipe/starter.dart';

Future<void> main(List<String> args) async {
  
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark ),
  );

  Flavor.create(
    Environment.production,
    name: "Production",
    color: Colors.green,
   );
  launchApp(); 
}
