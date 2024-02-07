// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvestmentDataMapStruct extends FFFirebaseStruct {
  InvestmentDataMapStruct({
    double? profitRatio,
    DocumentReference? investmentRef,
    DocumentReference? investorRef,
    String? investmentId,
    int? duration,
    double? points,
    double? amount,
    DateTime? createdTime,
    double? investorEvaluation,
    TransactionType? transactionType,
    String? transactionTypeStr,
    double? investorBalance,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _profitRatio = profitRatio,
        _investmentRef = investmentRef,
        _investorRef = investorRef,
        _investmentId = investmentId,
        _duration = duration,
        _points = points,
        _amount = amount,
        _createdTime = createdTime,
        _investorEvaluation = investorEvaluation,
        _transactionType = transactionType,
        _transactionTypeStr = transactionTypeStr,
        _investorBalance = investorBalance,
        super(firestoreUtilData);

  // "profit_ratio" field.
  double? _profitRatio;
  double get profitRatio => _profitRatio ?? 0.0;
  set profitRatio(double? val) => _profitRatio = val;
  void incrementProfitRatio(double amount) =>
      _profitRatio = profitRatio + amount;
  bool hasProfitRatio() => _profitRatio != null;

  // "investment_ref" field.
  DocumentReference? _investmentRef;
  DocumentReference? get investmentRef => _investmentRef;
  set investmentRef(DocumentReference? val) => _investmentRef = val;
  bool hasInvestmentRef() => _investmentRef != null;

  // "investor_ref" field.
  DocumentReference? _investorRef;
  DocumentReference? get investorRef => _investorRef;
  set investorRef(DocumentReference? val) => _investorRef = val;
  bool hasInvestorRef() => _investorRef != null;

  // "investment_id" field.
  String? _investmentId;
  String get investmentId => _investmentId ?? '';
  set investmentId(String? val) => _investmentId = val;
  bool hasInvestmentId() => _investmentId != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  set duration(int? val) => _duration = val;
  void incrementDuration(int amount) => _duration = duration + amount;
  bool hasDuration() => _duration != null;

  // "points" field.
  double? _points;
  double get points => _points ?? 0.0;
  set points(double? val) => _points = val;
  void incrementPoints(double amount) => _points = points + amount;
  bool hasPoints() => _points != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;
  void incrementAmount(double amount) => _amount = amount + amount;
  bool hasAmount() => _amount != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;
  bool hasCreatedTime() => _createdTime != null;

  // "investor_evaluation" field.
  double? _investorEvaluation;
  double get investorEvaluation => _investorEvaluation ?? 0.0;
  set investorEvaluation(double? val) => _investorEvaluation = val;
  void incrementInvestorEvaluation(double amount) =>
      _investorEvaluation = investorEvaluation + amount;
  bool hasInvestorEvaluation() => _investorEvaluation != null;

  // "transaction_type" field.
  TransactionType? _transactionType;
  TransactionType? get transactionType => _transactionType;
  set transactionType(TransactionType? val) => _transactionType = val;
  bool hasTransactionType() => _transactionType != null;

  // "transaction_type_str" field.
  String? _transactionTypeStr;
  String get transactionTypeStr => _transactionTypeStr ?? '';
  set transactionTypeStr(String? val) => _transactionTypeStr = val;
  bool hasTransactionTypeStr() => _transactionTypeStr != null;

  // "investor_balance" field.
  double? _investorBalance;
  double get investorBalance => _investorBalance ?? 0.0;
  set investorBalance(double? val) => _investorBalance = val;
  void incrementInvestorBalance(double amount) =>
      _investorBalance = investorBalance + amount;
  bool hasInvestorBalance() => _investorBalance != null;

  static InvestmentDataMapStruct fromMap(Map<String, dynamic> data) =>
      InvestmentDataMapStruct(
        profitRatio: castToType<double>(data['profit_ratio']),
        investmentRef: data['investment_ref'] as DocumentReference?,
        investorRef: data['investor_ref'] as DocumentReference?,
        investmentId: data['investment_id'] as String?,
        duration: castToType<int>(data['duration']),
        points: castToType<double>(data['points']),
        amount: castToType<double>(data['amount']),
        createdTime: data['created_time'] as DateTime?,
        investorEvaluation: castToType<double>(data['investor_evaluation']),
        transactionType:
            deserializeEnum<TransactionType>(data['transaction_type']),
        transactionTypeStr: data['transaction_type_str'] as String?,
        investorBalance: castToType<double>(data['investor_balance']),
      );

  static InvestmentDataMapStruct? maybeFromMap(dynamic data) => data is Map
      ? InvestmentDataMapStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'profit_ratio': _profitRatio,
        'investment_ref': _investmentRef,
        'investor_ref': _investorRef,
        'investment_id': _investmentId,
        'duration': _duration,
        'points': _points,
        'amount': _amount,
        'created_time': _createdTime,
        'investor_evaluation': _investorEvaluation,
        'transaction_type': _transactionType?.serialize(),
        'transaction_type_str': _transactionTypeStr,
        'investor_balance': _investorBalance,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'profit_ratio': serializeParam(
          _profitRatio,
          ParamType.double,
        ),
        'investment_ref': serializeParam(
          _investmentRef,
          ParamType.DocumentReference,
        ),
        'investor_ref': serializeParam(
          _investorRef,
          ParamType.DocumentReference,
        ),
        'investment_id': serializeParam(
          _investmentId,
          ParamType.String,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.int,
        ),
        'points': serializeParam(
          _points,
          ParamType.double,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'investor_evaluation': serializeParam(
          _investorEvaluation,
          ParamType.double,
        ),
        'transaction_type': serializeParam(
          _transactionType,
          ParamType.Enum,
        ),
        'transaction_type_str': serializeParam(
          _transactionTypeStr,
          ParamType.String,
        ),
        'investor_balance': serializeParam(
          _investorBalance,
          ParamType.double,
        ),
      }.withoutNulls;

  static InvestmentDataMapStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      InvestmentDataMapStruct(
        profitRatio: deserializeParam(
          data['profit_ratio'],
          ParamType.double,
          false,
        ),
        investmentRef: deserializeParam(
          data['investment_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['investment_data'],
        ),
        investorRef: deserializeParam(
          data['investor_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        investmentId: deserializeParam(
          data['investment_id'],
          ParamType.String,
          false,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.int,
          false,
        ),
        points: deserializeParam(
          data['points'],
          ParamType.double,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        investorEvaluation: deserializeParam(
          data['investor_evaluation'],
          ParamType.double,
          false,
        ),
        transactionType: deserializeParam<TransactionType>(
          data['transaction_type'],
          ParamType.Enum,
          false,
        ),
        transactionTypeStr: deserializeParam(
          data['transaction_type_str'],
          ParamType.String,
          false,
        ),
        investorBalance: deserializeParam(
          data['investor_balance'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'InvestmentDataMapStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InvestmentDataMapStruct &&
        profitRatio == other.profitRatio &&
        investmentRef == other.investmentRef &&
        investorRef == other.investorRef &&
        investmentId == other.investmentId &&
        duration == other.duration &&
        points == other.points &&
        amount == other.amount &&
        createdTime == other.createdTime &&
        investorEvaluation == other.investorEvaluation &&
        transactionType == other.transactionType &&
        transactionTypeStr == other.transactionTypeStr &&
        investorBalance == other.investorBalance;
  }

  @override
  int get hashCode => const ListEquality().hash([
        profitRatio,
        investmentRef,
        investorRef,
        investmentId,
        duration,
        points,
        amount,
        createdTime,
        investorEvaluation,
        transactionType,
        transactionTypeStr,
        investorBalance
      ]);
}

InvestmentDataMapStruct createInvestmentDataMapStruct({
  double? profitRatio,
  DocumentReference? investmentRef,
  DocumentReference? investorRef,
  String? investmentId,
  int? duration,
  double? points,
  double? amount,
  DateTime? createdTime,
  double? investorEvaluation,
  TransactionType? transactionType,
  String? transactionTypeStr,
  double? investorBalance,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InvestmentDataMapStruct(
      profitRatio: profitRatio,
      investmentRef: investmentRef,
      investorRef: investorRef,
      investmentId: investmentId,
      duration: duration,
      points: points,
      amount: amount,
      createdTime: createdTime,
      investorEvaluation: investorEvaluation,
      transactionType: transactionType,
      transactionTypeStr: transactionTypeStr,
      investorBalance: investorBalance,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InvestmentDataMapStruct? updateInvestmentDataMapStruct(
  InvestmentDataMapStruct? investmentDataMap, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    investmentDataMap
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInvestmentDataMapStructData(
  Map<String, dynamic> firestoreData,
  InvestmentDataMapStruct? investmentDataMap,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (investmentDataMap == null) {
    return;
  }
  if (investmentDataMap.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && investmentDataMap.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final investmentDataMapData =
      getInvestmentDataMapFirestoreData(investmentDataMap, forFieldValue);
  final nestedData =
      investmentDataMapData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = investmentDataMap.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInvestmentDataMapFirestoreData(
  InvestmentDataMapStruct? investmentDataMap, [
  bool forFieldValue = false,
]) {
  if (investmentDataMap == null) {
    return {};
  }
  final firestoreData = mapToFirestore(investmentDataMap.toMap());

  // Add any Firestore field values
  investmentDataMap.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInvestmentDataMapListFirestoreData(
  List<InvestmentDataMapStruct>? investmentDataMaps,
) =>
    investmentDataMaps
        ?.map((e) => getInvestmentDataMapFirestoreData(e, true))
        .toList() ??
    [];
