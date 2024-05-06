import 'package:hamzahllc/config/app_config.dart';

class ArticlesRequest {
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {
      'api-key': ConfigService.apiKey,
      'facet': false,
      'facet_filter': false,
      'page': 1,
    };

    return map;
  }
}
