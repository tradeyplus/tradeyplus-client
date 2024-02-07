import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvestmentDataRecord extends FirestoreRecord {
  InvestmentDataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "profit_ratio" field.
  double? _profitRatio;
  double get profitRatio => _profitRatio ?? 0.0;
  bool hasProfitRatio() => _profitRatio != null;

  // "investment_ref" field.
  DocumentReference? _investmentRef;
  DocumentReference? get investmentRef => _investmentRef;
  bool hasInvestmentRef() => _investmentRef != null;

  // "investor_ref" field.
  DocumentReference? _investorRef;
  DocumentReference? get investorRef => _investorRef;
  bool hasInvestorRef() => _investorRef != null;

  // "investment_id" field.
  String? _investmentId;
  String get investmentId => _investmentId ?? '';
  bool hasInvestmentId() => _investmentId != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "points" field.
  double? _points;
  double get points => _points ?? 0.0;
  bool hasPoints() => _points != null;

  // "investor_evaluation" field.
  double? _investorEvaluation;
  double get investorEvaluation => _investorEvaluation ?? 0.0;
  bool hasInvestorEvaluation() => _investorEvaluation != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "transaction_type" field.
  TransactionType? _transactionType;
  TransactionType? get transactionType => _transactionType;
  bool hasTransactionType() => _transactionType != null;

  // "transaction_type_str" field.
  String? _transactionTypeStr;
  String get transactionTypeStr => _transactionTypeStr ?? '';
  bool hasTransactionTypeStr() => _transactionTypeStr != null;

  // "investor_balance" field.
  double? _investorBalance;
  double get investorBalance => _investorBalance ?? 0.0;
  bool hasInvestorBalance() => _investorBalance != null;

  void _initializeFields() {
    _profitRatio = castToType<double>(snapshotData['profit_ratio']);
    _investmentRef = snapshotData['investment_ref'] as DocumentReference?;
    _investorRef = snapshotData['investor_ref'] as DocumentReference?;
    _investmentId = snapshotData['investment_id'] as String?;
    _duration = castToType<int>(snapshotData['duration']);
    _amount = castToType<double>(snapshotData['amount']);
    _points = castToType<double>(snapshotData['points']);
    _investorEvaluation =
        castToType<double>(snapshotData['investor_evaluation']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _transactionType =
        deserializeEnum<TransactionType>(snapshotData['transaction_type']);
    _transactionTypeStr = snapshotData['transaction_type_str'] as String?;
    _investorBalance = castToType<double>(snapshotData['investor_balance']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('investment_data');

  static Stream<InvestmentDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InvestmentDataRecord.fromSnapshot(s));

  static Future<InvestmentDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InvestmentDataRecord.fromSnapshot(s));

  static InvestmentDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InvestmentDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InvestmentDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InvestmentDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InvestmentDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InvestmentDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInvestmentDataRecordData({
  double? profitRatio,
  DocumentReference? investmentRef,
  DocumentReference? investorRef,
  String? investmentId,
  int? duration,
  double? amount,
  double? points,
  double? investorEvaluation,
  DateTime? createdTime,
  TransactionType? transactionType,
  String? transactionTypeStr,
  double? investorBalance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'profit_ratio': profitRatio,
      'investment_ref': investmentRef,
      'investor_ref': investorRef,
      'investment_id': investmentId,
      'duration': duration,
      'amount': amount,
      'points': points,
      'investor_evaluation': investorEvaluation,
      'created_time': createdTime,
      'transaction_type': transactionType,
      'transaction_type_str': transactionTypeStr,
      'investor_balance': investorBalance,
    }.withoutNulls,
  );

  return firestoreData;
}

class InvestmentDataRecordDocumentEquality
    implements Equality<InvestmentDataRecord> {
  const InvestmentDataRecordDocumentEquality();

  @override
  bool equals(InvestmentDataRecord? e1, InvestmentDataRecord? e2) {
    return e1?.profitRatio == e2?.profitRatio &&
        e1?.investmentRef == e2?.investmentRef &&
        e1?.investorRef == e2?.investorRef &&
        e1?.investmentId == e2?.investmentId &&
        e1?.duration == e2?.duration &&
        e1?.amount == e2?.amount &&
        e1?.points == e2?.points &&
        e1?.investorEvaluation == e2?.investorEvaluation &&
        e1?.createdTime == e2?.createdTime &&
        e1?.transactionType == e2?.transactionType &&
        e1?.transactionTypeStr == e2?.transactionTypeStr &&
        e1?.investorBalance == e2?.investorBalance;
  }

  @override
  int hash(InvestmentDataRecord? e) => const ListEquality().hash([
        e?.profitRatio,
        e?.investmentRef,
        e?.investorRef,
        e?.investmentId,
        e?.duration,
        e?.amount,
        e?.points,
        e?.investorEvaluation,
        e?.createdTime,
        e?.transactionType,
        e?.transactionTypeStr,
        e?.investorBalance
      ]);

  @override
  bool isValidKey(Object? o) => o is InvestmentDataRecord;
}
