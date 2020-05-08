# VehiclePushAnalysis

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Vin** | **string** | vehicle identification number | [optional] [default to null]
**Departure** | **string** | city/location where the trip started | [optional] [default to null]
**Destination** | **string** | city/location where the trip ended | [optional] [default to null]
**RefuelStops** | [**[]ModelBreak**](Break.md) | a list of all refuel stops during the trip | [optional] [default to null]
**Consumption** | **float32** | the average consumption during the trip (l/100km) | [optional] [default to null]
**Breaks** | [**[]ModelBreak**](Break.md) | a list of all breaks during the trip including the refuel stops | [optional] [default to null]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


