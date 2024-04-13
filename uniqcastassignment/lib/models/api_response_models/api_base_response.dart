abstract class ApiBaseResponse {
  int? _statusCode;
  String? _status;
  String? _message;

  int? get statusCode => _statusCode;
  String? get status => _status;
  String? get message => _message;

  ApiBaseResponse({
    int? statusCode,
    String? status,
    String? message,
  }) {
    _statusCode = statusCode;
    _status = status;
    _message = message;
  }

  ApiBaseResponse.fromJson(dynamic json) {
    if (json is Map) {
      _statusCode = json["statusCode"] as int?;
      _status = json["status"] as String?;
      _message = json["status"]?.toLowerCase() != "ok"
          ? (json["data"]?["message"] as String?)
          : null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map["statusCode"] = _statusCode;
    map["status"] = _status;
    map["message"] = _message;
    return map;
  }
}
