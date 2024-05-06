import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hamzahllc/app_widget.dart';
import 'package:hamzahllc/base/Injection/locator.dart';
import 'package:hamzahllc/config/app_config.dart';
import 'package:hamzahllc/constant/app_enums.dart';
import 'package:hamzahllc/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupLocator();
  await const ConfigService(flavor: Flavor.production).init();
  return runApp(
    const MyApp(),
  );
}
