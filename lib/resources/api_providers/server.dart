import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:uniqcastassignment/models/data_models/user.dart';
import 'package:uniqcastassignment/utils/constants/api_constants.dart';
import 'package:uniqcastassignment/utils/constants/app_constants.dart';
import 'package:uniqcastassignment/utils/app_messages.dart';
import 'package:uniqcastassignment/utils/globals.dart';
import 'package:uniqcastassignment/utils/my_pref.dart';

enum ApiType {
  get,
  post,
}

class Server {
  Server._();

  static Future<Response> get(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _call(
      url,
      apiType: ApiType.get,
      queryParameters: queryParameters,
      headers: headers,
    );
  }

  static Future<Response> post(
    String url, {
    Map<String, String>? headers,
    dynamic data,
  }) async {
    return _call(
      url,
      apiType: ApiType.post,
      data: data,
      headers: headers,
    );
  }

  static Future<Response> _call(
    String url, {
    required ApiType apiType,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    if (await isInternetAvailable()) {
      User? user;

      try {
        final dio = Dio();

        dio.options.baseUrl = ApiConstants.baseUrl;
        if (headers != null) {
          for (final String key in headers.keys) {
            dio.options.headers[key] = headers[key];
          }
        }
        if (queryParameters != null) {
          dio.options.queryParameters = queryParameters;
        }
        dio.options.headers['Content-Type'] = 'application/json';

        user = MyPref.getCurrentUser();
        if (user != null) {
          dio.options.headers['Authorization'] =
              '${user.tokenType} ${user.accessToken}';
        }

        final Response response;
        switch (apiType) {
          case ApiType.get:
            response = await dio.get(url);
          case ApiType.post:
            response = await dio.post(url, data: jsonEncode(data));
        }

        return response;
      } catch (e) {
        if (e is DioException && user?.accessToken != null) {
          if (e.response?.statusCode == 401) {
            _navigateToLoginScreen();
          }
        }
        rethrow;
      }
    } else {
      throw AppConstants.checkYourInternetConnection;
    }
  }

  static void _navigateToLoginScreen() {
    logOutUser();
  }

  static Future<bool> isInternetAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      AppMessages.showErrorSnackBar(AppConstants.checkYourInternetConnection);
      return false;
    }
  }
}
