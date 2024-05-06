import "package:flutter/material.dart";

// Application specific settings and constants
class AppSettings {
  static const String appName = "Hamzahllc";
  static const String appBundle = "com.crocoit.ecomservice";
  static const String fakeImage = "https://picsum.photos/250?image=2";
  static const Size designSize = Size(375, 812);
}

// User preferences keys
class AppPref {
  static const String env = "env";
  static const String isLogin = "isLogin";
  static const String isSignByGoggle = "isSignByGoggle";
  static const String fingerPrintActive = "fingerPrintActive";
}

// User preferences keys
class AppSecureStorage {
  static const String email = "email";
  static const String password = "password";
}

// Application flavors for different development stages
class AppFlavor {
  static const String dev = "dev";
  static const String prod = "prod";
}

// Font family used in the application
class FontFamily {
  static const String almarai = "almarai";
}
