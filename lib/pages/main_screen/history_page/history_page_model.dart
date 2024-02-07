import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'history_page_widget.dart' show HistoryPageWidget;
import 'package:flutter/material.dart';

class HistoryPageModel extends FlutterFlowModel<HistoryPageWidget> {
  ///  Local state fields for this page.

  List<InvestmentDataMapStruct> currentInvestmentData = [];
  void addToCurrentInvestmentData(InvestmentDataMapStruct item) =>
      currentInvestmentData.add(item);
  void removeFromCurrentInvestmentData(InvestmentDataMapStruct item) =>
      currentInvestmentData.remove(item);
  void removeAtIndexFromCurrentInvestmentData(int index) =>
      currentInvestmentData.removeAt(index);
  void insertAtIndexInCurrentInvestmentData(
          int index, InvestmentDataMapStruct item) =>
      currentInvestmentData.insert(index, item);
  void updateCurrentInvestmentDataAtIndex(
          int index, Function(InvestmentDataMapStruct) updateFn) =>
      currentInvestmentData[index] = updateFn(currentInvestmentData[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
