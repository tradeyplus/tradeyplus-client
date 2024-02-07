import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'request_withdraw_widget.dart' show RequestWithdrawWidget;
import 'package:flutter/material.dart';

class RequestWithdrawModel extends FlutterFlowModel<RequestWithdrawWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MailRecord? outputCreateDocMail;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
