import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'test_text_field_model.dart';
export 'test_text_field_model.dart';

class TestTextFieldWidget extends StatefulWidget {
  const TestTextFieldWidget({super.key});

  @override
  State<TestTextFieldWidget> createState() => _TestTextFieldWidgetState();
}

class _TestTextFieldWidgetState extends State<TestTextFieldWidget> {
  late TestTextFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestTextFieldModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      child: TextFormField(
        controller: _model.textController,
        focusNode: _model.textFieldFocusNode,
        autofocus: false,
        obscureText: false,
        decoration: InputDecoration(
          isDense: true,
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Tajawal',
                letterSpacing: 0.0,
              ),
          hintText: FFLocalizations.of(context).getText(
            '7yndyje4' /* TextField */,
          ),
          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Tajawal',
                letterSpacing: 0.0,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Tajawal',
              letterSpacing: 0.0,
            ),
        cursorColor: FlutterFlowTheme.of(context).primaryText,
        validator: _model.textControllerValidator.asValidator(context),
      ),
    );
  }
}
