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

  // State field(s) for monthlyAmount widget.
  FocusNode? monthlyAmountFocusNode;
  TextEditingController? monthlyAmountTextController;
  String? Function(BuildContext, String?)? monthlyAmountTextControllerValidator;
  // State field(s) for billAmount widget.
  FocusNode? billAmountFocusNode;
  TextEditingController? billAmountTextController;
  String? Function(BuildContext, String?)? billAmountTextControllerValidator;
  // State field(s) for yieldPercentage widget.
  FocusNode? yieldPercentageFocusNode;
  TextEditingController? yieldPercentageTextController;
  String? Function(BuildContext, String?)?
      yieldPercentageTextControllerValidator;
  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    monthlyAmountFocusNode?.dispose();
    monthlyAmountTextController?.dispose();

    billAmountFocusNode?.dispose();
    billAmountTextController?.dispose();

    yieldPercentageFocusNode?.dispose();
    yieldPercentageTextController?.dispose();
  }
}
