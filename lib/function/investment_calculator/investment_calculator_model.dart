import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'investment_calculator_widget.dart' show InvestmentCalculatorWidget;
import 'package:flutter/material.dart';

class InvestmentCalculatorModel
    extends FlutterFlowModel<InvestmentCalculatorWidget> {
  ///  Local state fields for this page.

  double investmentCalculator = 0.0;

  bool? billFocused;

  bool? profitFocused;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for monthlyAmount widget.
  FocusNode? monthlyAmountFocusNode;
  TextEditingController? monthlyAmountController;
  String? Function(BuildContext, String?)? monthlyAmountControllerValidator;
  // State field(s) for billAmount widget.
  FocusNode? billAmountFocusNode;
  TextEditingController? billAmountController;
  String? Function(BuildContext, String?)? billAmountControllerValidator;
  // State field(s) for yieldPercentage widget.
  FocusNode? yieldPercentageFocusNode;
  TextEditingController? yieldPercentageController;
  String? Function(BuildContext, String?)? yieldPercentageControllerValidator;
  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    monthlyAmountFocusNode?.dispose();
    monthlyAmountController?.dispose();

    billAmountFocusNode?.dispose();
    billAmountController?.dispose();

    yieldPercentageFocusNode?.dispose();
    yieldPercentageController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
