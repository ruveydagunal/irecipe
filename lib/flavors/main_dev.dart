
import 'package:firebase_core/firebase_core.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irecipe/firebase_options.dart';
import 'package:irecipe/starter.dart';

Future<void> main(List<String> args) async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
