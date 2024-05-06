import 'package:hamzahllc/models/response/articles_model.dart';

class MyRoutesQuery {
  static Map<String, dynamic> articlesDetailsQuery({
    required ArticlesModel data,
  }) {
    return {
      'articlesModel': data,
    };
  }
}
