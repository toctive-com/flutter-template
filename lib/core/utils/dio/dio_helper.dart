import 'dart:async';

import 'package:dio/dio.dart';
import 'package:template/core/dependency_injection/get_it.dart';
import 'package:template/core/interceptors/dio_interceptor.dart';

/// Handle Http Request
class DioHelper {
  static Dio instanceDio() {
    Dio dio = gi();
    dio.interceptors.add(AppInterceptors(gi(), gi()));
    return dio;
  }

  Future<Response> post(
    String path, {
    data,
    queryParameters,
    headers,
    formData,
    Options? options,
    Function(int, int)? onReceiveProgress,
  }) async {
    return await instanceDio().post(
      path,
      data: data,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      options: options ?? Options(headers: headers),
    );
  }

  Future<Response> put(
    String path, {
    data,
    queryParameters,
    headers,
    Options? options,
    Function(int, int)? onReceiveProgress,
  }) async {
    return await instanceDio().put(
      path,
      data: data,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      options: options ?? Options(headers: headers),
    );
  }

  Future<Response> patch(
    String path, {
    data,
    queryParameters,
    headers,
    Options? options,
    Function(int, int)? onReceiveProgress,
  }) async {
    return await instanceDio().patch(
      path,
      data: data,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      options: options ?? Options(headers: headers),
    );
  }

  Future<Response> get(
    String path, {
    dynamic queryParameters,
    token,
    headers,
    Options? options,
    Function(int, int)? onReceiveProgress,
  }) async {
    return instanceDio().get(
      path,
      queryParameters: queryParameters,
      options: options ?? Options(headers: headers),
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response> delete(
    String path, {
    queryParameters,
    token,
    headers,
    Options? options,
  }) async {
    return await instanceDio().delete(
      path,
      queryParameters: queryParameters,
      options: options ?? Options(headers: headers),
    );
  }
}
