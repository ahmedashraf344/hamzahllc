import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:hamzahllc/base/Injection/locator.dart";
import "package:hamzahllc/constant/app_enums.dart";
import "package:hamzahllc/services/local_storage_service/local_storage_service.dart";

class ConfigService {
  const ConfigService({this.flavor});

  final Flavor? flavor;

  Future<void> init() async {
    final prefService = locator<LocalStorageService>();
    final dotenv = DotEnv();

    switch (flavor!) {
      case Flavor.production:
        {
          await dotenv.load(fileName: ".env.prod");
          baseUrl = dotenv.get("BASE_URL");
          baseUrlImage = dotenv.get("BASE_URL_IMAGE");
          apiKey = dotenv.get("API_KEY");

          prefService.env = "prod";
        }
        break;
      case Flavor.test:
        {
          await dotenv.load(fileName: ".env.test");
          baseUrl = dotenv.get("BASE_URL");
          baseUrlImage = dotenv.get("BASE_URL_IMAGE");
          apiKey = dotenv.get("API_KEY");
          prefService.env = "dev";
        }
        break;
    }
  }

  static late String baseUrl;
  static late String baseUrlImage;
  static late String apiKey;
}
