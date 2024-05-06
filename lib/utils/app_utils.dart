import 'package:hamzahllc/config/app_config.dart';
import 'package:intl/intl.dart';

class AppUtils {
  static String fullImageUrl(String path) {
    return ConfigService.baseUrlImage + path;
  }

  static String formatDate(String isoDateString) {
    DateTime dateTime = DateTime.parse(isoDateString);
    String formattedDate = DateFormat('yyyy-MM-dd – HH:mm').format(dateTime);
    return formattedDate;
  }
}
