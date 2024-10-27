//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class UsersApi {
  UsersApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Delete User
  ///
  /// 指定されたuidのユーザを削除します。 アクセスしたユーザは認証済みである必要があります。
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] uid (required):
  Future<Response> deleteUserApiUsersUidDeleteWithHttpInfo(String uid,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/users/{uid}'
      .replaceAll('{uid}', uid);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Delete User
  ///
  /// 指定されたuidのユーザを削除します。 アクセスしたユーザは認証済みである必要があります。
  ///
  /// Parameters:
  ///
  /// * [String] uid (required):
  Future<Object?> deleteUserApiUsersUidDelete(String uid,) async {
    final response = await deleteUserApiUsersUidDeleteWithHttpInfo(uid,);
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

  /// Get User Profile
  ///
  /// 自身以外のユーザプロフィール
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] uid (required):
  Future<Response> getUserProfileApiUsersUidGetWithHttpInfo(String uid,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/users/{uid}'
      .replaceAll('{uid}', uid);

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

  /// Get User Profile
  ///
  /// 自身以外のユーザプロフィール
  ///
  /// Parameters:
  ///
  /// * [String] uid (required):
  Future<UserProfile?> getUserProfileApiUsersUidGet(String uid,) async {
    final response = await getUserProfileApiUsersUidGetWithHttpInfo(uid,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserProfile',) as UserProfile;
    
    }
    return null;
  }

  /// Update User Info
  ///
  /// 指定されたユーザーの指定された項目を更新する
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [UserInfo] userInfo (required):
  Future<Response> updateUserInfoApiUsersMePutWithHttpInfo(UserInfo userInfo,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/users/me';

    // ignore: prefer_final_locals
    Object? postBody = userInfo;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Update User Info
  ///
  /// 指定されたユーザーの指定された項目を更新する
  ///
  /// Parameters:
  ///
  /// * [UserInfo] userInfo (required):
  Future<UserInfo?> updateUserInfoApiUsersMePut(UserInfo userInfo,) async {
    final response = await updateUserInfoApiUsersMePutWithHttpInfo(userInfo,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserInfo',) as UserInfo;
    
    }
    return null;
  }

  /// User Me
  ///
  /// アクセスしたユーザのデータを返します。アクセスしたユーザがDBに登録されていなかった場合新しく作成します。
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> userMeApiUsersMeGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/users/me';

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

  /// User Me
  ///
  /// アクセスしたユーザのデータを返します。アクセスしたユーザがDBに登録されていなかった場合新しく作成します。
  Future<UserInfo?> userMeApiUsersMeGet() async {
    final response = await userMeApiUsersMeGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserInfo',) as UserInfo;
    
    }
    return null;
  }
}
