import 'package:uniqcastassignment/models/api_response_models/api_base_response.dart';
import 'package:uniqcastassignment/models/data_models/user.dart';

///response model class used for login
class AuthApiResponse extends ApiBaseResponse {
  User? _data;

  User? get data => _data;

  AuthApiResponse({
    super.statusCode,
    super.message,
    User? data,
  }) {
    _data = data;
  }

  AuthApiResponse.fromJson(dynamic json) : super.fromJson(json) {
    if (json is Map) {
      _data = json["data"] != null ? User.fromJson(json["data"]) : null;
    }
  }
}
