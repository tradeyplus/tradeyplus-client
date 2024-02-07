// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfitDistributionRatioStruct extends FFFirebaseStruct {
  ProfitDistributionRatioStruct({
    double? commission,
    double? profit,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _commission = commission,
        _profit = profit,
        super(firestoreUtilData);

  // "commission" field.
  double? _commission;
  double get commission => _commission ?? 0.3;
  set commission(double? val) => _commission = val;
  void incrementCommission(double amount) => _commission = commission + amount;
  bool hasCommission() => _commission != null;

  // "profit" field.
  double? _profit;
  double get profit => _profit ?? 0.7;
  set profit(double? val) => _profit = val;
  void incrementProfit(double amount) => _profit = profit + amount;
  bool hasProfit() => _profit != null;

  static ProfitDistributionRatioStruct fromMap(Map<String, dynamic> data) =>
      ProfitDistributionRatioStruct(
        commission: castToType<double>(data['commission']),
        profit: castToType<double>(data['profit']),
      );

  static ProfitDistributionRatioStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? ProfitDistributionRatioStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'commission': _commission,
        'profit': _profit,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'commission': serializeParam(
          _commission,
          ParamType.double,
        ),
        'profit': serializeParam(
          _profit,
          ParamType.double,
        ),
      }.withoutNulls;

  static ProfitDistributionRatioStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProfitDistributionRatioStruct(
        commission: deserializeParam(
          data['commission'],
          ParamType.double,
          false,
        ),
        profit: deserializeParam(
          data['profit'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ProfitDistributionRatioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProfitDistributionRatioStruct &&
        commission == other.commission &&
        profit == other.profit;
  }

  @override
  int get hashCode => const ListEquality().hash([commission, profit]);
}

ProfitDistributionRatioStruct createProfitDistributionRatioStruct({
  double? commission,
  double? profit,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProfitDistributionRatioStruct(
      commission: commission,
      profit: profit,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProfitDistributionRatioStruct? updateProfitDistributionRatioStruct(
  ProfitDistributionRatioStruct? profitDistributionRatio, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    profitDistributionRatio
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProfitDistributionRatioStructData(
  Map<String, dynamic> firestoreData,
  ProfitDistributionRatioStruct? profitDistributionRatio,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (profitDistributionRatio == null) {
    return;
  }
  if (profitDistributionRatio.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      profitDistributionRatio.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final profitDistributionRatioData = getProfitDistributionRatioFirestoreData(
      profitDistributionRatio, forFieldValue);
  final nestedData =
      profitDistributionRatioData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      profitDistributionRatio.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProfitDistributionRatioFirestoreData(
  ProfitDistributionRatioStruct? profitDistributionRatio, [
  bool forFieldValue = false,
]) {
  if (profitDistributionRatio == null) {
    return {};
  }
  final firestoreData = mapToFirestore(profitDistributionRatio.toMap());

  // Add any Firestore field values
  profitDistributionRatio.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProfitDistributionRatioListFirestoreData(
  List<ProfitDistributionRatioStruct>? profitDistributionRatios,
) =>
    profitDistributionRatios
        ?.map((e) => getProfitDistributionRatioFirestoreData(e, true))
        .toList() ??
    [];
