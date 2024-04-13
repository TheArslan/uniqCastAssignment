class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://office-new-dev.uniqcast.com:12611';

  static const String logInApiUrl = '/api/client/v2/global/login';

  static String fetchPackegesApiUrl(
    String operatorId,
    String userId,
  ) =>
      '/api/client/v1/$operatorId/users/$userId/packages';

  static String fetchChannelsApiUrl(
    String operatorId,
  ) =>
      '/api/client/v2/$operatorId/channels';
  static String fetchImageUrl(
    String channelId,
  ) =>
      'https://office-new-dev.uniqcast.com:12802/api/client/v1/global/images/$channelId?accessKey=WkVjNWNscFhORDBLCg==';
}
