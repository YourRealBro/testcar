# \VehicleTripAnalyzerApi

All URIs are relative to *https://localhost/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**Analyze**](VehicleTripAnalyzerApi.md#Analyze) | **Post** /trip | analyze a vehicle trip


# **Analyze**
> VehiclePushAnalysis Analyze(ctx, body)
analyze a vehicle trip

this endpoints gets a list of data points from a vehicle. the whole list represents a trip from one location to another with several stops to refuel or just to eat some cookies.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ctx** | **context.Context** | context for authentication, logging, cancellation, deadlines, tracing, etc.
  **body** | [**VehiclePush**](VehiclePush.md)| vehicle data that needs to be analyzed | 

### Return type

[**VehiclePushAnalysis**](VehiclePushAnalysis.md)

### Authorization

[BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

