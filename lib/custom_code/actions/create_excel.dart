// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'dart:io';
import 'package:excel/excel.dart';
import 'package:path/path.dart' as p;

Future createExcel(List<InvestmentDataMapStruct> investmentDataList) async {
  // Add your function code here!
  var excel = Excel.createExcel(); // Create a new Excel document
  var sheetName = 'Investments'; // Name of the sheet
  var sheet = excel[sheetName]; // Create or Get a sheet by name

  // Define the headers
  List<String> headers = [
    'Profit Ratio',
    'Investment Ref',
    'Investor Ref',
    'Investment ID',
    'Duration',
    'Amount',
    'Points',
    'Investor Evaluation',
    'Created Time',
    'Transaction Type',
    'Transaction Type Str',
    'Investor Balance',
  ];

  // Insert headers into the first row
  sheet.appendRow(headers);

  // Iterate through the investment data list and append rows
  investmentDataList.forEach((data) {
    sheet.appendRow([
      data.profitRatio,
      data.investmentRef,
      data.investorRef,
      data.investmentId,
      data.duration,
      data.amount,
      data.points,
      data.investorEvaluation,
      data.createdTime
          .toString(), // Assuming you want to convert DateTime to String
      data.transactionType.toString(), // Convert enum to String if necessary
      data.transactionTypeStr,
      data.investorBalance,
    ]);
  });

  // Save the file to disk - example path, adjust according to your needs
  var fileBytes = excel.save();
  var filePath = p.join(Directory.current.path, "Investments.xlsx");
  File(filePath)
    ..createSync(recursive: true)
    ..writeAsBytesSync(fileBytes!);
}
