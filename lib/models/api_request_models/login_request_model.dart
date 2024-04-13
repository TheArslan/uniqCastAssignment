class LoginRequestModel {
  final String userName;
  final String password;

  LoginRequestModel(this.userName, this.password);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map["login_type"] = "Credentials";
    map["username"] = userName;
    map["password"] = password;
    map["device"] = "flutter_test_device_Arslan_Afzal";
    return map;
  }
}
