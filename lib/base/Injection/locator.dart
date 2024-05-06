import "package:flutter/foundation.dart";
import "package:get_it/get_it.dart";
import "package:hamzahllc/services/alert_service/alert_service.dart";
import "package:hamzahllc/services/api_rest_service/api_rest_service.dart";
import "package:hamzahllc/services/launcher_service/launcher_service.dart";
import "package:hamzahllc/services/local_storage_service/local_storage_service.dart";
import "package:hamzahllc/services/navigation_service/navigation_service.dart";

// Global service locator
final GetIt locator = GetIt.I;

/// Sets up and registers the services with GetIt.
/// This should be called at the start of the app.
Future<void> setupLocator() async {
  try {
    // Register Local Storage service
    final LocalStorageService localStorageService =
        await LocalStorageService.getInstance();
    locator.registerSingleton<LocalStorageService>(localStorageService);

    // Register other services
    locator
      ..registerLazySingleton(() => NavigationService())
      ..registerLazySingleton(() => AlertService())
      ..registerLazySingleton(() => LauncherService())
      ..registerLazySingleton(() => ApiService());
  } catch (e) {
    // Handle any exceptions during service setup
    if (kDebugMode) {
      print('Error setting up locator: $e');
    }
  }
}
