import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetHistoricalDataForexAUDUSDCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetHistoricalDataForexAUDUSD',
      apiUrl:
          'https://marketdata.tradermade.com/api/v1/hour_historical?api_key=zHDuzzeHO49Aa2gPaWGq&currency=AUDUSD&date_time=2024-02-05-10:00',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetHistoricalDataForexGBPUSDCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetHistoricalDataForexGBPUSD',
      apiUrl:
          'https://marketdata.tradermade.com/api/v1/hour_historical?api_key=zHDuzzeHO49Aa2gPaWGq&currency=GBPUSD&date_time=2024-02-05-10:00',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetHistoricalDataForexEURUSDCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetHistoricalDataForexEURUSD',
      apiUrl:
          'https://marketdata.tradermade.com/api/v1/hour_historical?api_key=zHDuzzeHO49Aa2gPaWGq&currency=EURUSD&date_time=2024-02-05-10:00',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetHistoricalDataForexNZDUSDCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetHistoricalDataForexNZDUSD',
      apiUrl:
          'https://marketdata.tradermade.com/api/v1/hour_historical?api_key=zHDuzzeHO49Aa2gPaWGq&currency=NZDUSD&date_time=2024-02-05-10:00',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetHistoricalDataForexCADUSDCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetHistoricalDataForexCADUSD',
      apiUrl:
          'https://marketdata.tradermade.com/api/v1/hour_historical?api_key=zHDuzzeHO49Aa2gPaWGq&currency=CADUSD&date_time=2024-02-05-10:00',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetHistoricalDataForexCHFUSDCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetHistoricalDataForexCHFUSD',
      apiUrl:
          'https://marketdata.tradermade.com/api/v1/hour_historical?api_key=zHDuzzeHO49Aa2gPaWGq&currency=CHFUSD&date_time=2024-02-05-10:00',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetHistoricalDataForexJPYUSDCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetHistoricalDataForexJPYUSD',
      apiUrl:
          'https://marketdata.tradermade.com/api/v1/hour_historical?api_key=zHDuzzeHO49Aa2gPaWGq&currency=JPYUSD&date_time=2024-02-05-10:00',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
