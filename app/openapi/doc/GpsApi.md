# openapi.api.GpsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**setGpsApiGpsPost**](GpsApi.md#setgpsapigpspost) | **POST** /api/gps/ | Set Gps


# **setGpsApiGpsPost**
> JsonObject setGpsApiGpsPost(gPSRequestBody)

Set Gps

GPS位置情報と関連付けた音楽URLを保存します

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getGpsApi();
final GPSRequestBody gPSRequestBody = ; // GPSRequestBody | 

try {
    final response = api.setGpsApiGpsPost(gPSRequestBody);
    print(response);
} catch on DioException (e) {
    print('Exception when calling GpsApi->setGpsApiGpsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **gPSRequestBody** | [**GPSRequestBody**](GPSRequestBody.md)|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

