class NetworkHeaders {
  static Map<String, String> getHeaders({
    required String token,
    required String wid,
    required String rootOrgId,
    required String apiKey,
  }) {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'bearer $apiKey',
      'x-authenticated-user-token': '$token',
      'x-authenticated-userid': '$wid',
      'rootorg': 'igot',
      'userid': '$wid',
      'x-authenticated-user-orgid': '$rootOrgId'
    };
    return headers;
  }

  static Map<String, String> profilePostHeaders({
    required String token,
    required String wid,
    required String rootOrgId,
    required String apiKey,
  }) {
    Map<String, String> headers = {
      'Authorization': 'bearer ${apiKey}',
      'x-authenticated-user-token': '$token',
      'Content-Type': 'application/json',
      'x-authenticated-userid': '$wid',
      'wid': '$wid',
      'userId': '$wid',
      'x-authenticated-user-orgid': '$rootOrgId'
    };
    return headers;
  }

  static Map<String, String> postHeaders({
    required String token,
    required String wid,
    required String rootOrgId,
    required String apiKey,
    required String baseUrl,
  }) {
    Map<String, String> headers = {
      'Authorization': 'bearer ${apiKey}',
      'x-authenticated-user-token': '$token',
      'Content-Type': 'application/json',
      'hostpath': baseUrl,
      'locale': 'en',
      'org': 'dopt',
      'rootOrg': 'igot',
      'wid': '$wid',
      'userId': '$wid',
      'x-authenticated-user-orgid': '$rootOrgId'
    };
    return headers;
  }
}
