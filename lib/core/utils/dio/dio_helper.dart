import 'dart:async';

import 'package:dio/dio.dart';
import 'package:template/core/dependency_injection/get_it.dart';
import 'package:template/core/interceptors/dio_interceptor.dart';

/// Handle Http Request
class DioHelper {
  /// init dio
  static Dio instanceDio() {
    final dio = gi() as Dio;
    dio.interceptors.add(AppInterceptors(gi(), gi()));
    return dio;
  }

  /// post request
  Future<Response<dynamic>> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? formData,
    Options? options,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return instanceDio().post(
      path,
      data: data,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      options: options ?? Options(headers: headers),
    );
  }

  // put request
  Future<Response<dynamic>> put(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return instanceDio().put(
      path,
      data: data,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      options: options ?? Options(headers: headers),
    );
  }

  /// patch request
  Future<Response<dynamic>> patch(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return instanceDio().patch(
      path,
      data: data,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      options: options ?? Options(headers: headers),
    );
  }

  /// get request
  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    String? token,
    Map<String, dynamic>? headers,
    Options? options,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return instanceDio().get(
      path,
      queryParameters: queryParameters,
      options: options ?? Options(headers: headers),
      onReceiveProgress: onReceiveProgress,
    );
  }

  // delete request
  Future<Response<dynamic>> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    String? token,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {
    return instanceDio().delete(
      path,
      queryParameters: queryParameters,
      options: options ?? Options(headers: headers),
    );
  }
}
