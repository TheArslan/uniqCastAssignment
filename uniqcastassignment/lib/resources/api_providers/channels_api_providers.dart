import 'package:dio/dio.dart';
import 'package:uniqcastassignment/models/api_response_models/channel_api_response.dart';

import 'package:uniqcastassignment/models/api_response_models/packages_api_response.dart';
import 'package:uniqcastassignment/models/data_models/packages.dart';
import 'package:uniqcastassignment/models/data_models/user.dart';
import 'package:uniqcastassignment/resources/api_providers/server.dart';
import 'package:uniqcastassignment/utils/constants/api_constants.dart';
import 'package:uniqcastassignment/utils/constants/app_constants.dart';
import 'package:uniqcastassignment/utils/my_pref.dart';

class ChannelsApiProvider {
  Future<PackagesApiResponse> fetchPackages() async {
    try {
      User? user = MyPref.getCurrentUser();
      if (user != null && user.userId != null && user.operatorUid != null) {
        final Response response = await Server.get(
            ApiConstants.fetchPackegesApiUrl(
                user.operatorUid!, user.userId.toString()),
            queryParameters: {"device_class": "Mobile"});
        return PackagesApiResponse.fromJson(response.data);
      }
      return PackagesApiResponse(
          message: AppConstants.fetchinPackagesFailedTryAgain);
    } catch (e) {
      if (e is DioException) {
        if (e.response?.data == null) {
          return PackagesApiResponse(
              message: AppConstants.fetchinPackagesFailedTryAgain);
        }
        return PackagesApiResponse.fromJson(e.response?.data);
      } else {
        return PackagesApiResponse(message: e.toString());
      }
    }
  }

  Future<ChannelApiResponse> fetchChannels(List<Package> packages) async {
    try {
      User? user = MyPref.getCurrentUser();
      final packagesId = packages.map((e) => e.id).toList();
      final params = {'packages': packagesId.join(',')};
      if (user != null && user.operatorUid != null) {
        final Response response = await Server.get(
            ApiConstants.fetchChannelsApiUrl(user.operatorUid!),
            queryParameters: params);

        return ChannelApiResponse.fromJson(response.data);
      }
      return ChannelApiResponse(
          message: AppConstants.fetchinPackagesFailedTryAgain);
    } catch (e) {
      if (e is DioException) {
        if (e.response?.data == null) {
          return ChannelApiResponse(
              message: AppConstants.fetchinPackagesFailedTryAgain);
        }
        return ChannelApiResponse.fromJson(e.response?.data);
      } else {
        return ChannelApiResponse(message: e.toString());
      }
    }
  }
}
