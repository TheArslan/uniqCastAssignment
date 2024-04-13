import 'package:uniqcastassignment/models/api_request_models/login_request_model.dart';
import 'package:uniqcastassignment/models/api_response_models/auth_api_response.dart';
import 'package:uniqcastassignment/models/api_response_models/channel_api_response.dart';
import 'package:uniqcastassignment/models/api_response_models/packages_api_response.dart';
import 'package:uniqcastassignment/models/data_models/packages.dart';
import 'package:uniqcastassignment/resources/api_providers/auth_apis_provider.dart';
import 'package:uniqcastassignment/resources/api_providers/channels_api_providers.dart';

class Repository {
  final AuthApiProvider _authApiProvider = AuthApiProvider();
  final ChannelsApiProvider _channelsApiProvider = ChannelsApiProvider();
  Future<AuthApiResponse> loginUser(LoginRequestModel data) =>
      _authApiProvider.loginUser(data);
  Future<PackagesApiResponse> fetchPackages() =>
      _channelsApiProvider.fetchPackages();
  Future<ChannelApiResponse> fetchChannels(List<Package> packages) =>
      _channelsApiProvider.fetchChannels(packages);
}
