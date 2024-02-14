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

Future<void> createExcel(
    List<InvestmentDataMapStruct> investmentDataList) async {
  var excel = Excel.createExcel(); // Create a new Excel document
  var sheetName = 'Investments'; // Name of the sheet
  Sheet sheet = excel[sheetName]!; // Create or Get a sheet by name

  // Define the headers
  List<String> headers = [
    'Amount',
    'Transaction Type',
    'Entry Date',
    'Duration',
    'Investor Balance',
  ];

  // Insert headers into the first row
  for (int i = 0; i < headers.length; i++) {
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0)).value =
        TextCellValue(headers[i]);
  }

  // Iterate through the investment data list and append rows
  for (var rowIndex = 1; rowIndex <= investmentDataList.length; rowIndex++) {
    var data = investmentDataList[rowIndex - 1];

    // Ensure amount and investorBalance are not null and are doubles, otherwise use 0.0 as fallback
    var amount = data.amount ?? 0.0;
    var investorBalance = data.investorBalance ?? 0.0;

    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: rowIndex))
        .value = TextCellValue(amount.toStringAsFixed(2));
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: rowIndex))
        .value = TextCellValue(data.transactionTypeStr);
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: rowIndex))
        .value = TextCellValue(data.createdTime!.toIso8601String());
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: rowIndex))
        .value = TextCellValue(data.duration.toString());
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: rowIndex))
        .value = TextCellValue(investorBalance.toStringAsFixed(2));
  }

  // Save the file to disk - example path, adjust according to your needs
  var fileBytes = excel.save();
  var filePath = p.join(Directory.current.path, "Investments.xlsx");
  File(filePath)
    ..createSync(recursive: true)
    ..writeAsBytesSync(fileBytes!);
}
