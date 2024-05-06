import "package:dio/dio.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/foundation.dart";
import "package:hamzahllc/base/Injection/locator.dart";
import "package:hamzahllc/config/app_config.dart";
import "package:hamzahllc/services/alert_service/alert_service.dart";
import "package:tf_dio_cache/tf_dio_cache.dart";

// ignore: constant_identifier_names
enum MethodsName { GET, POST, PUT, DELETE }

class ApiService {
  ApiService() {
    _dio = Dio()
      ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true))
      ..interceptors.add(
        DioCacheManager(
          CacheConfig(
            baseUrl: _getBaseUrl(),
          ),
        ).interceptor,
      )
      ..interceptors.add(InterceptorsWrapper());
  }

  final _alertService = locator<AlertService>();

  late final Dio _dio;

  String? _getBaseUrl() => ConfigService.baseUrl;

  Future<Response?> request({
    BuildContext? context,
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    required String method,
    bool loading = false,
    bool forceRefresh = false,
  }) async {
    final baseUrl = "${_getBaseUrl()}$path";
    if (loading) _prepareLoading(context!);

    try {
      final response = await _dio
          .request(
            baseUrl,
            data: body,
            queryParameters: query,
            options: buildCacheOptions(
              const Duration(days: 5),
              options: Options(method: method),
              forceRefresh: forceRefresh,
            ),
          )
          .whenComplete(_alertService.closeLoading);

      return response;
    } on DioException catch (e) {
      if (context!.mounted) {
        _handleDioError(context, e);
      }
      return e.response;
    } finally {
      _alertService.closeLoading();
    }
  }

  void _prepareLoading(BuildContext context) {
    FocusScope.of(context).unfocus();
    _alertService.showLoadingDialog(context);
  }

  void _handleDioError(BuildContext context, DioException e) {
    if (kDebugMode) {
      print("${e.response?.data["message"]}");
    }
  }
}
