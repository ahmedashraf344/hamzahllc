import "package:bot_toast/bot_toast.dart";
import "package:flutter/material.dart";
import "package:flutter_easyloading/flutter_easyloading.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:hamzahllc/base/router/app_navigation.dart";
import "package:hamzahllc/base/themes/themes_config.dart";
import "package:hamzahllc/constant/app_settings.dart";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();

    return ScreenUtilInit(
      designSize: AppSettings.designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          routerConfig: AppNavigation.router,
          debugShowCheckedModeBanner: false,
          title: AppSettings.appName,
          theme: MyThemesConfig.defaultThem(context),
          builder: (_, child) {
            child = botToastBuilder(context, child);
            child = FlutterEasyLoading(child: child);
            return child;
          },
        );
      },
    );
  }
}
