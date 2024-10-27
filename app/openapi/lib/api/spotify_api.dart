//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class SpotifyApi {
  SpotifyApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Spotify Callback
  ///
  /// Process login response from Google.  When a login or registration is successful, you will be automatically logged in via a URL with query parameters.  :param request: Request object of fastAPI. :param code: String will be use to retrieve access token. :param user_dao: UserDAO Object :param token_dao: TokenDAO Object :raises NotVerifiedEmailError: If not verified email :returns:     Redirect to login url or response     BadRequest(400) when code is not valid.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] code:
  Future<Response> spotifyCallbackApiSpotifyCallbackGetWithHttpInfo({ String? code, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/spotify/callback';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (code != null) {
      queryParams.addAll(_queryParams('', 'code', code));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Spotify Callback
  ///
  /// Process login response from Google.  When a login or registration is successful, you will be automatically logged in via a URL with query parameters.  :param request: Request object of fastAPI. :param code: String will be use to retrieve access token. :param user_dao: UserDAO Object :param token_dao: TokenDAO Object :raises NotVerifiedEmailError: If not verified email :returns:     Redirect to login url or response     BadRequest(400) when code is not valid.
  ///
  /// Parameters:
  ///
  /// * [String] code:
  Future<Object?> spotifyCallbackApiSpotifyCallbackGet({ String? code, }) async {
    final response = await spotifyCallbackApiSpotifyCallbackGetWithHttpInfo( code: code, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Object',) as Object;
    
    }
    return null;
  }

  /// Spotify Login
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> spotifyLoginApiSpotifyLoginGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/spotify/login';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Spotify Login
  Future<Object?> spotifyLoginApiSpotifyLoginGet() async {
    final response = await spotifyLoginApiSpotifyLoginGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Object',) as Object;
    
    }
    return null;
  }
}
