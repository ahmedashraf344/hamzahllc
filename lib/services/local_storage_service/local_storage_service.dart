import "package:hamzahllc/constant/app_settings.dart";
import "package:shared_preferences/shared_preferences.dart";

class LocalStorageService {
  static SharedPreferences? _preferences;
  static LocalStorageService? _instance;

  static Future<LocalStorageService> getInstance() async {
    _instance ??= LocalStorageService();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  // Environment
  String get env => _preferences?.getString(AppPref.env) ?? AppFlavor.dev;

  set env(String value) => _preferences?.setString(AppPref.env, value);

  // isLogin
  bool get isLogin => _preferences?.getBool(AppPref.isLogin) ?? false;

  set isLogin(bool value) => _preferences?.setBool(AppPref.isLogin, value);

  // isLogin
  bool get isSignByGoggle =>
      _preferences?.getBool(AppPref.isSignByGoggle) ?? false;

  set isSignByGoggle(bool value) =>
      _preferences?.setBool(AppPref.isSignByGoggle, value);

  // isLogin
  bool get fingerPrintActive =>
      _preferences?.getBool(AppPref.fingerPrintActive) ?? false;

  set fingerPrintActive(bool value) =>
      _preferences?.setBool(AppPref.fingerPrintActive, value);
}
