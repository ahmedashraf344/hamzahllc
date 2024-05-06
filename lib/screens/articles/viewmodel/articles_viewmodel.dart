// ignore_for_file: use_build_context_synchronously

part of '../articles_imports.dart';

class ArticlesViewModel {
  /// secure storage

  final _storage = const FlutterSecureStorage();

  final GenericCubit<String> _userEmailCubit = GenericCubit('');

  Future<void> _restoreSecureData() async {
    var savedEmail = await _storage.read(key: AppSecureStorage.email);
    _userEmailCubit.onUpdateData(savedEmail ?? "");
  }

  /// services

  final _apiService = locator<ApiService>();
  final _alertService = locator<AlertService>();
  final _prefService = locator<LocalStorageService>();

  final GenericCubit<List<ArticlesModel>> _articlesCubit = GenericCubit([]);

  /// fetch articles

  final _cacheManager = DefaultCacheManager();

  Future<void> _fetchArticles(BuildContext context) async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      // No internet connection
      final cachedData = await _cacheManager.getSingleFile(MyApiKeys.articles);
      final articlesModel = List<ArticlesModel>.from(
        jsonDecode(cachedData.readAsStringSync()).map(ArticlesModel.fromJson),
      );
      if (kDebugMode) {
        print("get data from cache");
      }
      _articlesCubit.onUpdateData(articlesModel);
    } else {
      // Has internet connection
      var response = await _apiService.request(
        context: context,
        path: MyApiKeys.articles,
        method: MethodsName.GET.name,
        query: ArticlesRequest().toJson(),
      );

      final articlesModel = List<ArticlesModel>.from(
        response?.data['response']['docs'].map(ArticlesModel.fromJson),
      );

      final jsonString = jsonEncode(response?.data['response']['docs']);
      final bytes = utf8.encode(jsonString);
      await _cacheManager.putFile(
        MyApiKeys.articles,
        Uint8List.fromList(bytes),
        eTag: DateTime.now().toString(),
      );
      if (kDebugMode) {
        print("get data from api");
      }
      _articlesCubit.onUpdateData(articlesModel);
    }
  }

  /// work manger

  static void callbackDispatcher() {
    Workmanager().executeTask((task, inputData) async {
      if (kDebugMode) {
        print("Background task started");
      }

      // Perform background fetch of articles
      final apiService =
          locator<ApiService>(); // Ensure services are initialized
      final cacheManager = DefaultCacheManager();

      var response = await apiService.request(
        path: MyApiKeys.articles,
        method: MethodsName.GET.name,
      );

      if (response != null) {
        final jsonString = jsonEncode(response.data['response']['docs']);
        final bytes = utf8.encode(jsonString);
        await cacheManager.putFile(
          MyApiKeys.articles,
          Uint8List.fromList(bytes),
          eTag: DateTime.now().toString(),
        );
        if (kDebugMode) {
          print("Background fetch completed.");
        }
      }
      return Future.value(true); // Return true to indicate successful execution
    });
  }

  void setupBackgroundTask() {
    Workmanager().initialize(
      callbackDispatcher,
      // The top-level function, as entry point for background tasks
      isInDebugMode: true,
    );
    Workmanager().registerPeriodicTask(
      "1", // Unique task name
      "fetchArticles", // Task ID
      frequency: const Duration(seconds: 10), // Frequency of task execution
      constraints: Constraints(
        networkType:
            NetworkType.connected, // Only run when network is available
      ),
    );
  }

  /// action buttons

  void _logoutButtonAction(BuildContext context) {
    _prefService.isLogin = false;
    _prefService.isSignByGoggle = false;
    context.pushReplacementNamed(MyRoutes.login);
  }
}
