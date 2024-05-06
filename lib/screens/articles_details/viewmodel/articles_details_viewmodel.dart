part of '../articles_details_imports.dart';

class ArticlesDetailsViewModel {
  final _launcherService = locator<LauncherService>();

  void _launchArticleDetails({required String url}) {
    _launcherService.launchMyUrl(url: url);
  }
}
