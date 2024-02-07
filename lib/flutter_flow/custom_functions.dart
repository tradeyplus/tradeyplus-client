import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

List<InvestmentDataMapStruct> getPeriodicData(
  List<InvestmentDataRecord> allInvestmentData,
  int? monthlyDuration,
) {
  if (monthlyDuration == null || monthlyDuration <= 0) {
    return []; // Return an empty list if the duration is invalid
  }

  // Calculate the threshold date
  final DateTime currentDate = DateTime.now();
  final DateTime thresholdDate = DateTime(
    currentDate.year,
    currentDate.month - monthlyDuration,
    currentDate.day,
  );

  // Filter the investment data records
  List<InvestmentDataRecord> filteredData = allInvestmentData.where((record) {
    return record.createdTime?.isAfter(thresholdDate) ?? false;
  }).toList();
  List<InvestmentDataMapStruct> investmentDataMaps = filteredData.map((record) {
    return InvestmentDataMapStruct(
      profitRatio: record.profitRatio,
      investmentRef: record.investmentRef,
      investorRef: record.investorRef,
      investmentId: record.investmentId,
      duration: record.duration,
      amount: record.amount,
      points: record.points,
      investorEvaluation: record.investorEvaluation,
      createdTime: record.createdTime,
      transactionType: record.transactionType,
      transactionTypeStr: record.transactionTypeStr,
      investorBalance: record.investorBalance,
    );
  }).toList();
  return investmentDataMaps;
}

double addInvestmentAmount(List<double> investmentAmountList) {
  return investmentAmountList.fold(0.0, (sum, element) => sum + element);
}

List<InvestmentDataMapStruct> mapInvestmentData(
    List<InvestmentDataRecord>? investmentDataList) {
  if (investmentDataList != null && investmentDataList.length > 0) {
    List<InvestmentDataMapStruct> investmentDataMaps =
        investmentDataList.map((record) {
      return InvestmentDataMapStruct(
        profitRatio: record.profitRatio,
        investmentRef: record.investmentRef,
        investorRef: record.investorRef,
        investmentId: record.investmentId,
        duration: record.duration,
        amount: record.amount,
        points: record.points,
        investorEvaluation: record.investorEvaluation,
        createdTime: record.createdTime,
        transactionType: record.transactionType,
        transactionTypeStr: record.transactionTypeStr,
        investorBalance: record.investorBalance,
      );
    }).toList();
    return investmentDataMaps;
  } else {
    return [];
  }
}

List<double> getBarchartData(
  List<double>? profitDataList,
  List<double>? depositDataList,
  bool isDeposit,
) {
  // Check if either list is null, return an empty list if so
  if (profitDataList == null || depositDataList == null) {
    return [];
  }

  // Determine the length of the longer list
  int maxLength = profitDataList.length > depositDataList.length
      ? profitDataList.length
      : depositDataList.length;

  // Fill the shorter list with zeros until it reaches the length of the longer list
  if (profitDataList.length < maxLength) {
    profitDataList.addAll(List.filled(maxLength - profitDataList.length, 0));
  }
  if (depositDataList.length < maxLength) {
    depositDataList.addAll(List.filled(maxLength - depositDataList.length, 0));
  }

  // Return the appropriate list based on the isDeposit parameter
  return isDeposit ? depositDataList : profitDataList;
}
