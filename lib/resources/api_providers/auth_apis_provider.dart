import 'package:dio/dio.dart';
import 'package:uniqcastassignment/models/api_request_models/login_request_model.dart';
import 'package:uniqcastassignment/models/api_response_models/auth_api_response.dart';
import 'package:uniqcastassignment/resources/api_providers/server.dart';
import 'package:uniqcastassignment/utils/constants/api_constants.dart';
import 'package:uniqcastassignment/utils/constants/app_constants.dart';

class AuthApiProvider {
  Future<AuthApiResponse> loginUser(LoginRequestModel data) async {
    try {
      final Response response =
          await Server.post(ApiConstants.logInApiUrl, data: data.toJson());
      return AuthApiResponse.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        if (e.response?.data == null) {
          return AuthApiResponse(message: AppConstants.loginFailedTryAgain);
        }
        return AuthApiResponse.fromJson(e.response?.data);
      } else {
        return AuthApiResponse(message: e.toString());
      }
    }
  }
}
