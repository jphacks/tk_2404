# openapi.api.UsersApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteUserApiUsersUidDelete**](UsersApi.md#deleteuserapiusersuiddelete) | **DELETE** /api/users/{uid} | Delete User
[**getUserProfileApiUsersUidGet**](UsersApi.md#getuserprofileapiusersuidget) | **GET** /api/users/{uid} | Get User Profile
[**updateUserInfoApiUsersMePut**](UsersApi.md#updateuserinfoapiusersmeput) | **PUT** /api/users/me | Update User Info
[**userMeApiUsersMeGet**](UsersApi.md#usermeapiusersmeget) | **GET** /api/users/me | User Me


# **deleteUserApiUsersUidDelete**
> JsonObject deleteUserApiUsersUidDelete(uid)

Delete User

指定されたuidのユーザを削除します。 アクセスしたユーザは認証済みである必要があります。

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getUsersApi();
final String uid = uid_example; // String | 

try {
    final response = api.deleteUserApiUsersUidDelete(uid);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->deleteUserApiUsersUidDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uid** | **String**|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserProfileApiUsersUidGet**
> UserProfile getUserProfileApiUsersUidGet(uid)

Get User Profile

自身以外のユーザプロフィール

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getUsersApi();
final String uid = uid_example; // String | 

try {
    final response = api.getUserProfileApiUsersUidGet(uid);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->getUserProfileApiUsersUidGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uid** | **String**|  | 

### Return type

[**UserProfile**](UserProfile.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateUserInfoApiUsersMePut**
> UserInfo updateUserInfoApiUsersMePut(userInfo)

Update User Info

指定されたユーザーの指定された項目を更新する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getUsersApi();
final UserInfo userInfo = ; // UserInfo | 

try {
    final response = api.updateUserInfoApiUsersMePut(userInfo);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->updateUserInfoApiUsersMePut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userInfo** | [**UserInfo**](UserInfo.md)|  | 

### Return type

[**UserInfo**](UserInfo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userMeApiUsersMeGet**
> UserInfo userMeApiUsersMeGet()

User Me

アクセスしたユーザのデータを返します。アクセスしたユーザがDBに登録されていなかった場合新しく作成します。

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getUsersApi();

try {
    final response = api.userMeApiUsersMeGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->userMeApiUsersMeGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UserInfo**](UserInfo.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

