import '/components/test_text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'test_text_field_page_widget.dart' show TestTextFieldPageWidget;
import 'package:flutter/material.dart';

class TestTextFieldPageModel extends FlutterFlowModel<TestTextFieldPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Model for TestTextField component.
  late TestTextFieldModel testTextFieldModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    testTextFieldModel = createModel(context, () => TestTextFieldModel());
  }

  @override
  void dispose() {
    testTextFieldModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
