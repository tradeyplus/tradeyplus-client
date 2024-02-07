// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionStruct extends FFFirebaseStruct {
  TransactionStruct({
    TransactionType? transactionType,
    double? amount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _transactionType = transactionType,
        _amount = amount,
        super(firestoreUtilData);

  // "transaction_type" field.
  TransactionType? _transactionType;
  TransactionType get transactionType =>
      _transactionType ?? TransactionType.DEPOSIT;
  set transactionType(TransactionType? val) => _transactionType = val;
  bool hasTransactionType() => _transactionType != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;
  void incrementAmount(double amount) => _amount = amount + amount;
  bool hasAmount() => _amount != null;

  static TransactionStruct fromMap(Map<String, dynamic> data) =>
      TransactionStruct(
        transactionType:
            deserializeEnum<TransactionType>(data['transaction_type']),
        amount: castToType<double>(data['amount']),
      );

  static TransactionStruct? maybeFromMap(dynamic data) => data is Map
      ? TransactionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'transaction_type': _transactionType?.serialize(),
        'amount': _amount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'transaction_type': serializeParam(
          _transactionType,
          ParamType.Enum,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
      }.withoutNulls;

  static TransactionStruct fromSerializableMap(Map<String, dynamic> data) =>
      TransactionStruct(
        transactionType: deserializeParam<TransactionType>(
          data['transaction_type'],
          ParamType.Enum,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'TransactionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TransactionStruct &&
        transactionType == other.transactionType &&
        amount == other.amount;
  }

  @override
  int get hashCode => const ListEquality().hash([transactionType, amount]);
}

TransactionStruct createTransactionStruct({
  TransactionType? transactionType,
  double? amount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TransactionStruct(
      transactionType: transactionType,
      amount: amount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TransactionStruct? updateTransactionStruct(
  TransactionStruct? transaction, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    transaction
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTransactionStructData(
  Map<String, dynamic> firestoreData,
  TransactionStruct? transaction,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (transaction == null) {
    return;
  }
  if (transaction.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && transaction.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final transactionData =
      getTransactionFirestoreData(transaction, forFieldValue);
  final nestedData =
      transactionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = transaction.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTransactionFirestoreData(
  TransactionStruct? transaction, [
  bool forFieldValue = false,
]) {
  if (transaction == null) {
    return {};
  }
  final firestoreData = mapToFirestore(transaction.toMap());

  // Add any Firestore field values
  transaction.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTransactionListFirestoreData(
  List<TransactionStruct>? transactions,
) =>
    transactions?.map((e) => getTransactionFirestoreData(e, true)).toList() ??
    [];
