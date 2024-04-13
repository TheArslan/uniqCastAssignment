class Package {
  int? _id;
  String? _purchased;

  int? get id => _id;
  String? get purchased => _purchased;

  Package({
    int? id,
    String? purchased,
  }) {
    _id = id;
    _purchased = purchased;
  }

  Package.fromJson(dynamic json) {
    if (json is Map) {
      _id = json["id"] as int?;
      _purchased = json["purchased"] as String?;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map["id"] = _id;
    map["purchased"] = _purchased;

    return map;
  }
}
