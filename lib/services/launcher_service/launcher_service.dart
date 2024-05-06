// import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class LauncherService {
  Future<void> launchMyUrl({required String url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
