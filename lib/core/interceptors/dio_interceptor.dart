import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:template/core/apis/api_class.dart';
import 'package:template/core/utils/shared_preference/shared_preference_helper.dart';

/// No internet connection
const noInternetConnection = 'No internet connection';

/// App Interceptors
class AppInterceptors extends Interceptor {
  /// App Interceptors Constructor
  AppInterceptors(this.sharedPreferencesHelper, this.dio);

  /// Dio
  final Dio dio;

  /// Header accept language
  static const acceptLangHeader = 'Accept-Language';

  /// Header accept
  static const acceptHeader = 'accept';

  /// Header content encoding
  static const contentEncodingHeader = 'content-encoding';

  /// Header content length
  static const contentLengthHeader = 'content-length';

  /// Header content type
  static const contentTypeHeader = 'content-type';

  /// Header authorization
  static const authenticateHeader = 'Authorization';

  /// Header application json
  static const applicationJson = 'application/json';

  /// Header bearer
  static const bearer = 'Bearer ';

  /// Shared Preference Helper
  final SharedPreferencesHelper sharedPreferencesHelper;

  @override
  Future<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw DioException(
        error: noInternetConnection,
        requestOptions: options,
        response: Response(requestOptions: options),
      );
    } else if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      final token = await sharedPreferencesHelper.getToken();
      if (token != null) {
        options.headers.addAll({authenticateHeader: bearer + token});
      }

      options
        ..baseUrl = APIConstants.baseUrl

        /// Redirects true
        ..followRedirects = true
        // Set a timeout of 10 seconds for the request
        ..connectTimeout = const Duration(seconds: 60)
        // Receive data with a timeout of some seconds
        ..receiveTimeout = const Duration(seconds: 60)
        // Send data with a timeout of some seconds
        ..sendTimeout = const Duration(seconds: 60);

      /// Add Header Accepted
      options.headers.addAll({
        Headers.acceptHeader: applicationJson,
        Headers.contentTypeHeader: applicationJson,
        acceptLangHeader: 'en',
      });

      try {
        handler.next(options);
      } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.sendTimeout) {
          rethrow;
        } else {
          rethrow;
        }
      }
    }
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // handle specific error codes
  }
}
