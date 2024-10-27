# openapi.api.SpotifyApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**spotifyCallbackApiSpotifyCallbackGet**](SpotifyApi.md#spotifycallbackapispotifycallbackget) | **GET** /api/spotify/callback | Spotify Callback
[**spotifyLoginApiSpotifyLoginGet**](SpotifyApi.md#spotifyloginapispotifyloginget) | **GET** /api/spotify/login | Spotify Login


# **spotifyCallbackApiSpotifyCallbackGet**
> JsonObject spotifyCallbackApiSpotifyCallbackGet(code)

Spotify Callback

Process login response from Google.  When a login or registration is successful, you will be automatically logged in via a URL with query parameters.  :param request: Request object of fastAPI. :param code: String will be use to retrieve access token. :param user_dao: UserDAO Object :param token_dao: TokenDAO Object :raises NotVerifiedEmailError: If not verified email :returns:     Redirect to login url or response     BadRequest(400) when code is not valid.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSpotifyApi();
final String code = code_example; // String | 

try {
    final response = api.spotifyCallbackApiSpotifyCallbackGet(code);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SpotifyApi->spotifyCallbackApiSpotifyCallbackGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **code** | **String**|  | [optional] 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **spotifyLoginApiSpotifyLoginGet**
> JsonObject spotifyLoginApiSpotifyLoginGet()

Spotify Login

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSpotifyApi();

try {
    final response = api.spotifyLoginApiSpotifyLoginGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling SpotifyApi->spotifyLoginApiSpotifyLoginGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

