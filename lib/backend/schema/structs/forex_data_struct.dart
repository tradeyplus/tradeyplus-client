// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ForexDataStruct extends FFFirebaseStruct {
  ForexDataStruct({
    String? currency,
    String? endpoint,
    double? close,
    double? high,
    double? low,
    double? open,
    String? dateTime,
    String? requestTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _currency = currency,
        _endpoint = endpoint,
        _close = close,
        _high = high,
        _low = low,
        _open = open,
        _dateTime = dateTime,
        _requestTime = requestTime,
        super(firestoreUtilData);

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  set currency(String? val) => _currency = val;
  bool hasCurrency() => _currency != null;

  // "endpoint" field.
  String? _endpoint;
  String get endpoint => _endpoint ?? '';
  set endpoint(String? val) => _endpoint = val;
  bool hasEndpoint() => _endpoint != null;

  // "close" field.
  double? _close;
  double get close => _close ?? 0.0;
  set close(double? val) => _close = val;
  void incrementClose(double amount) => _close = close + amount;
  bool hasClose() => _close != null;

  // "high" field.
  double? _high;
  double get high => _high ?? 0.0;
  set high(double? val) => _high = val;
  void incrementHigh(double amount) => _high = high + amount;
  bool hasHigh() => _high != null;

  // "low" field.
  double? _low;
  double get low => _low ?? 0.0;
  set low(double? val) => _low = val;
  void incrementLow(double amount) => _low = low + amount;
  bool hasLow() => _low != null;

  // "open" field.
  double? _open;
  double get open => _open ?? 0.0;
  set open(double? val) => _open = val;
  void incrementOpen(double amount) => _open = open + amount;
  bool hasOpen() => _open != null;

  // "date_time" field.
  String? _dateTime;
  String get dateTime => _dateTime ?? '';
  set dateTime(String? val) => _dateTime = val;
  bool hasDateTime() => _dateTime != null;

  // "request_time" field.
  String? _requestTime;
  String get requestTime => _requestTime ?? '';
  set requestTime(String? val) => _requestTime = val;
  bool hasRequestTime() => _requestTime != null;

  static ForexDataStruct fromMap(Map<String, dynamic> data) => ForexDataStruct(
        currency: data['currency'] as String?,
        endpoint: data['endpoint'] as String?,
        close: castToType<double>(data['close']),
        high: castToType<double>(data['high']),
        low: castToType<double>(data['low']),
        open: castToType<double>(data['open']),
        dateTime: data['date_time'] as String?,
        requestTime: data['request_time'] as String?,
      );

  static ForexDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ForexDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'currency': _currency,
        'endpoint': _endpoint,
        'close': _close,
        'high': _high,
        'low': _low,
        'open': _open,
        'date_time': _dateTime,
        'request_time': _requestTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'currency': serializeParam(
          _currency,
          ParamType.String,
        ),
        'endpoint': serializeParam(
          _endpoint,
          ParamType.String,
        ),
        'close': serializeParam(
          _close,
          ParamType.double,
        ),
        'high': serializeParam(
          _high,
          ParamType.double,
        ),
        'low': serializeParam(
          _low,
          ParamType.double,
        ),
        'open': serializeParam(
          _open,
          ParamType.double,
        ),
        'date_time': serializeParam(
          _dateTime,
          ParamType.String,
        ),
        'request_time': serializeParam(
          _requestTime,
          ParamType.String,
        ),
      }.withoutNulls;

  static ForexDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ForexDataStruct(
        currency: deserializeParam(
          data['currency'],
          ParamType.String,
          false,
        ),
        endpoint: deserializeParam(
          data['endpoint'],
          ParamType.String,
          false,
        ),
        close: deserializeParam(
          data['close'],
          ParamType.double,
          false,
        ),
        high: deserializeParam(
          data['high'],
          ParamType.double,
          false,
        ),
        low: deserializeParam(
          data['low'],
          ParamType.double,
          false,
        ),
        open: deserializeParam(
          data['open'],
          ParamType.double,
          false,
        ),
        dateTime: deserializeParam(
          data['date_time'],
          ParamType.String,
          false,
        ),
        requestTime: deserializeParam(
          data['request_time'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ForexDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ForexDataStruct &&
        currency == other.currency &&
        endpoint == other.endpoint &&
        close == other.close &&
        high == other.high &&
        low == other.low &&
        open == other.open &&
        dateTime == other.dateTime &&
        requestTime == other.requestTime;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [currency, endpoint, close, high, low, open, dateTime, requestTime]);
}

ForexDataStruct createForexDataStruct({
  String? currency,
  String? endpoint,
  double? close,
  double? high,
  double? low,
  double? open,
  String? dateTime,
  String? requestTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ForexDataStruct(
      currency: currency,
      endpoint: endpoint,
      close: close,
      high: high,
      low: low,
      open: open,
      dateTime: dateTime,
      requestTime: requestTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ForexDataStruct? updateForexDataStruct(
  ForexDataStruct? forexData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    forexData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addForexDataStructData(
  Map<String, dynamic> firestoreData,
  ForexDataStruct? forexData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (forexData == null) {
    return;
  }
  if (forexData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && forexData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final forexDataData = getForexDataFirestoreData(forexData, forFieldValue);
  final nestedData = forexDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = forexData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getForexDataFirestoreData(
  ForexDataStruct? forexData, [
  bool forFieldValue = false,
]) {
  if (forexData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(forexData.toMap());

  // Add any Firestore field values
  forexData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getForexDataListFirestoreData(
  List<ForexDataStruct>? forexDatas,
) =>
    forexDatas?.map((e) => getForexDataFirestoreData(e, true)).toList() ?? [];
