class User {
  int? _userId;
  String? _operatorName;
  String? _operatorUid;
  String? _expiresIn;

  bool? _isBlocked;
  String? _tokenType;
  int? _deviceId;

  bool? _isMulticastNetwork;

  String? _accessToken;
  String? _refreshToken;

  int? get userId => _userId;
  String? get operatorName => _operatorName;
  String? get operatorUid => _operatorUid;
  String? get expiresIn => _expiresIn;

  bool? get isBlocked => _isBlocked;
  String? get tokenType => _tokenType;
  int? get deviceId => _deviceId;

  bool? get isMultiCastNetwork => _isMulticastNetwork;

  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  User({
    int? userId,
    String? operatorName,
    String? operatorUid,
    String? expiresIn,
    bool? isBlocked,
    String? tokenType,
    int? deviceId,
    bool? isMultiCastNetwork,
    String? accessToken,
    String? instagram,
  }) {
    _userId = userId;
    _operatorName = operatorName;
    _operatorUid = operatorUid;
    _expiresIn = expiresIn;

    _isBlocked = isBlocked;
    _tokenType = tokenType;
    _deviceId = deviceId;

    _isMulticastNetwork = isMultiCastNetwork;

    _accessToken = accessToken;
    _refreshToken = instagram;
  }

  User.fromJson(dynamic json) {
    if (json is Map) {
      _userId = json["user_id"] as int?;
      _operatorName = json["operator_name"] as String?;
      _operatorUid = json["operator_uid"] as String?;
      _expiresIn = json["expires_in"] as String?;

      _isBlocked = json["is_blocked"] as bool?;
      _tokenType = json["token_type"] as String?;
      _deviceId = json["device_id"] as int?;

      _isMulticastNetwork = json["is_multicast_network"] as bool?;

      _accessToken = json["access_token"] as String?;
      _refreshToken = json["refresh_token"] as String?;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map["user_id"] = _userId;
    map["operator_name"] = _operatorName;
    map["operator_uid"] = _operatorUid;
    map["expires_in"] = _expiresIn;

    map["is_blocked"] = _isBlocked;
    map["token_type"] = _tokenType;
    map["device_id"] = _deviceId;

    map["is_multicast_network"] = _isMulticastNetwork;

    map["access_token"] = _accessToken;
    map["refresh_token"] = _refreshToken;

    return map;
  }
}
