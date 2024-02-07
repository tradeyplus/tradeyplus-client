import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'barchart_widget.dart' show BarchartWidget;
import 'package:flutter/material.dart';

class BarchartModel extends FlutterFlowModel<BarchartWidget> {
  ///  Local state fields for this page.

  bool? selectedChart = false;

  bool selectedDate = false;

  int monthlyDuration = 3;

  List<InvestmentDataMapStruct> investmentDataList = [];
  void addToInvestmentDataList(InvestmentDataMapStruct item) =>
      investmentDataList.add(item);
  void removeFromInvestmentDataList(InvestmentDataMapStruct item) =>
      investmentDataList.remove(item);
  void removeAtIndexFromInvestmentDataList(int index) =>
      investmentDataList.removeAt(index);
  void insertAtIndexInInvestmentDataList(
          int index, InvestmentDataMapStruct item) =>
      investmentDataList.insert(index, item);
  void updateInvestmentDataListAtIndex(
          int index, Function(InvestmentDataMapStruct) updateFn) =>
      investmentDataList[index] = updateFn(investmentDataList[index]);

  bool? isLoaded;

  List<double> depositList = [];
  void addToDepositList(double item) => depositList.add(item);
  void removeFromDepositList(double item) => depositList.remove(item);
  void removeAtIndexFromDepositList(int index) => depositList.removeAt(index);
  void insertAtIndexInDepositList(int index, double item) =>
      depositList.insert(index, item);
  void updateDepositListAtIndex(int index, Function(double) updateFn) =>
      depositList[index] = updateFn(depositList[index]);

  List<double> profitList = [];
  void addToProfitList(double item) => profitList.add(item);
  void removeFromProfitList(double item) => profitList.remove(item);
  void removeAtIndexFromProfitList(int index) => profitList.removeAt(index);
  void insertAtIndexInProfitList(int index, double item) =>
      profitList.insert(index, item);
  void updateProfitListAtIndex(int index, Function(double) updateFn) =>
      profitList[index] = updateFn(profitList[index]);

  int loopIndex = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Barchart widget.
  List<InvestmentDataRecord>? investmentDocList;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<InvestmentDataMapStruct>();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
