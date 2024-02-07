import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "nationality" field.
  String? _nationality;
  String get nationality => _nationality ?? '';
  bool hasNationality() => _nationality != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "risk_ratio" field.
  double? _riskRatio;
  double get riskRatio => _riskRatio ?? 0.0;
  bool hasRiskRatio() => _riskRatio != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "package" field.
  Package? _package;
  Package? get package => _package;
  bool hasPackage() => _package != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "profit_distribution_ratio" field.
  ProfitDistributionRatioStruct? _profitDistributionRatio;
  ProfitDistributionRatioStruct get profitDistributionRatio =>
      _profitDistributionRatio ?? ProfitDistributionRatioStruct();
  bool hasProfitDistributionRatio() => _profitDistributionRatio != null;

  // "portfolio_type" field.
  PortfolioType? _portfolioType;
  PortfolioType? get portfolioType => _portfolioType;
  bool hasPortfolioType() => _portfolioType != null;

  // "investment_ref" field.
  DocumentReference? _investmentRef;
  DocumentReference? get investmentRef => _investmentRef;
  bool hasInvestmentRef() => _investmentRef != null;

  // "investment_period" field.
  int? _investmentPeriod;
  int get investmentPeriod => _investmentPeriod ?? 0;
  bool hasInvestmentPeriod() => _investmentPeriod != null;

  // "yield_period" field.
  int? _yieldPeriod;
  int get yieldPeriod => _yieldPeriod ?? 0;
  bool hasYieldPeriod() => _yieldPeriod != null;

  // "dob" field.
  DateTime? _dob;
  DateTime? get dob => _dob;
  bool hasDob() => _dob != null;

  // "user_role" field.
  UserRole? _userRole;
  UserRole? get userRole => _userRole;
  bool hasUserRole() => _userRole != null;

  // "payment_status" field.
  PaymentStatus? _paymentStatus;
  PaymentStatus? get paymentStatus => _paymentStatus;
  bool hasPaymentStatus() => _paymentStatus != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "balance" field.
  double? _balance;
  double get balance => _balance ?? 0.0;
  bool hasBalance() => _balance != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _nationality = snapshotData['nationality'] as String?;
    _note = snapshotData['note'] as String?;
    _riskRatio = castToType<double>(snapshotData['risk_ratio']);
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _package = deserializeEnum<Package>(snapshotData['package']);
    _address = snapshotData['address'] as String?;
    _profitDistributionRatio = ProfitDistributionRatioStruct.maybeFromMap(
        snapshotData['profit_distribution_ratio']);
    _portfolioType =
        deserializeEnum<PortfolioType>(snapshotData['portfolio_type']);
    _investmentRef = snapshotData['investment_ref'] as DocumentReference?;
    _investmentPeriod = castToType<int>(snapshotData['investment_period']);
    _yieldPeriod = castToType<int>(snapshotData['yield_period']);
    _dob = snapshotData['dob'] as DateTime?;
    _userRole = deserializeEnum<UserRole>(snapshotData['user_role']);
    _paymentStatus =
        deserializeEnum<PaymentStatus>(snapshotData['payment_status']);
    _password = snapshotData['password'] as String?;
    _balance = castToType<double>(snapshotData['balance']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? nationality,
  String? note,
  double? riskRatio,
  DocumentReference? userRef,
  Package? package,
  String? address,
  ProfitDistributionRatioStruct? profitDistributionRatio,
  PortfolioType? portfolioType,
  DocumentReference? investmentRef,
  int? investmentPeriod,
  int? yieldPeriod,
  DateTime? dob,
  UserRole? userRole,
  PaymentStatus? paymentStatus,
  String? password,
  double? balance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'nationality': nationality,
      'note': note,
      'risk_ratio': riskRatio,
      'user_ref': userRef,
      'package': package,
      'address': address,
      'profit_distribution_ratio': ProfitDistributionRatioStruct().toMap(),
      'portfolio_type': portfolioType,
      'investment_ref': investmentRef,
      'investment_period': investmentPeriod,
      'yield_period': yieldPeriod,
      'dob': dob,
      'user_role': userRole,
      'payment_status': paymentStatus,
      'password': password,
      'balance': balance,
    }.withoutNulls,
  );

  // Handle nested data for "profit_distribution_ratio" field.
  addProfitDistributionRatioStructData(
      firestoreData, profitDistributionRatio, 'profit_distribution_ratio');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.nationality == e2?.nationality &&
        e1?.note == e2?.note &&
        e1?.riskRatio == e2?.riskRatio &&
        e1?.userRef == e2?.userRef &&
        e1?.package == e2?.package &&
        e1?.address == e2?.address &&
        e1?.profitDistributionRatio == e2?.profitDistributionRatio &&
        e1?.portfolioType == e2?.portfolioType &&
        e1?.investmentRef == e2?.investmentRef &&
        e1?.investmentPeriod == e2?.investmentPeriod &&
        e1?.yieldPeriod == e2?.yieldPeriod &&
        e1?.dob == e2?.dob &&
        e1?.userRole == e2?.userRole &&
        e1?.paymentStatus == e2?.paymentStatus &&
        e1?.password == e2?.password &&
        e1?.balance == e2?.balance;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.nationality,
        e?.note,
        e?.riskRatio,
        e?.userRef,
        e?.package,
        e?.address,
        e?.profitDistributionRatio,
        e?.portfolioType,
        e?.investmentRef,
        e?.investmentPeriod,
        e?.yieldPeriod,
        e?.dob,
        e?.userRole,
        e?.paymentStatus,
        e?.password,
        e?.balance
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
