import 'package:uniqcastassignment/models/api_response_models/api_base_response.dart';

import 'package:uniqcastassignment/models/data_models/packages.dart';

///response model class used for pacakges
class PackagesApiResponse extends ApiBaseResponse {
  List<Package>? _packages;

  List<Package>? get packages => _packages;

  PackagesApiResponse({
    super.statusCode,
    super.message,
    List<Package>? packages,
  }) {
    _packages = packages;
  }

  PackagesApiResponse.fromJson(dynamic json) : super.fromJson(json) {
    _packages = [];
    if (json is Map && json["data"] is List) {
      _packages =
          (json["data"] as List).map((e) => Package.fromJson(e)).toList();
    }
  }
}
