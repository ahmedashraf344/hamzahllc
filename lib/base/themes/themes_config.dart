import 'package:flutter/material.dart';
import 'package:hamzahllc/constant/app_settings.dart';
import 'package:hamzahllc/resources/my_colors.dart';

class MyThemesConfig {
  static ThemeData defaultThem(BuildContext context) {
    return ThemeData(
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      brightness: Brightness.light,
      // canvasColor: Colors.red,
      // primarySwatch: Colors.red,
      fontFamily: FontFamily.almarai,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: MyColors.white,
      primaryColor: MyColors.primary,
      focusColor: MyColors.primary,
    );
  }
}
