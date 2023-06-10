import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:template/core/apis/api_class.dart';
import 'package:template/core/utils/shared_preference/shared_preference_helper.dart';

const noInternetConnection = 'No internet connection';

class AppInterceptors extends Interceptor {
  final Dio dio;

  // Header field name
  static const acceptLangHeader = "Accept-Language";
  static const acceptHeader = 'accept';
  static const contentEncodingHeader = 'content-encoding';
  static const contentLengthHeader = 'content-length';
  static const contentTypeHeader = 'content-type';
  static const authenticateHeader = 'Authorization';
  static const applicationJson = "application/json";
  static const bearer = "Bearer ";

  final SharedPreferencesHelper sharedPreferencesHelper;

  AppInterceptors(this.sharedPreferencesHelper, this.dio);

  @override
  Future onRequest(RequestOptions options, handler) async {
    var connectivityResult = await Connectivity().checkConnectivity();
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

      options.baseUrl = APIConstants.baseUrl;

      /// Redirects true
      options.followRedirects = true;
      // Set a timeout of 10 seconds for the request
      options.connectTimeout = const Duration(seconds: 60);
      options.receiveTimeout = const Duration(seconds: 60);
      options.sendTimeout = const Duration(seconds: 60);

      /// Add Header Accepted
      options.headers.addAll({
        Headers.acceptHeader: applicationJson,
        Headers.contentTypeHeader: applicationJson,
        acceptLangHeader: "en",
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
  Future<void> onError(DioException err, handler) async {
    // handle specific error codes
  }
}
