import 'package:uniqcastassignment/models/api_response_models/api_base_response.dart';
import 'package:uniqcastassignment/models/data_models/channel.dart';

///response model class used for pacakges
class ChannelApiResponse extends ApiBaseResponse {
  List<Channel>? _channels;

  List<Channel>? get channels => _channels;

  ChannelApiResponse({
    super.statusCode,
    super.message,
    List<Channel>? channels,
  }) {
    _channels = channels;
  }

  ChannelApiResponse.fromJson(dynamic json) : super.fromJson(json) {
    _channels = [];
    if (json is Map && json["data"] is List) {
      _channels =
          (json["data"] as List).map((e) => Channel.fromJson(e)).toList();
    }
  }
}
