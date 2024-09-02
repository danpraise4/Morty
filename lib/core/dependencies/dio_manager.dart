import 'dart:developer';

import '../apis/api_auth.dart';
import '../helpers/helpers.dart';
import 'package:dio/dio.dart';

class DioManager {
  final Dio dio;

  DioManager(this.dio);

  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    dio.options.headers = options.headers;
    handler.next(options);
  }

  void onResponse(options, ResponseInterceptorHandler handler) async {
    handler.resolve(options);
  }

  void onError(DioException e, ErrorInterceptorHandler handler) async {
    ll(e);
    if (e.response?.statusCode == 401) {
      try {
        // Retry the original request
        final originalRequest = e.requestOptions;

        final response = await dio.request(
          originalRequest.path,
          data: originalRequest.data,
          options: Options(
              headers: headers
                ..['Content-type'] = originalRequest.headers['Content-type']),
        );

        handler.resolve(response);
      } catch (exception) {
        pp(exception);
        handler.reject(e);
      }
    } else {
      log('$e');
      if (e.response?.statusCode == 503) {
        handler.reject(e);
      } else if (e.error == null) {
        handler.resolve(
          e.response ??
              Response(
                data: {'message': ''},
                requestOptions: RequestOptions(),
              ),
        );
      } else {
        handler.reject(e);
      }
    }
  }
}
