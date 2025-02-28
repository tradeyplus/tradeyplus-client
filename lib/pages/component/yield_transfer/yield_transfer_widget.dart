import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/success_dialog_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'yield_transfer_model.dart';
export 'yield_transfer_model.dart';

class YieldTransferWidget extends StatefulWidget {
  const YieldTransferWidget({super.key});

  @override
  State<YieldTransferWidget> createState() => _YieldTransferWidgetState();
}

class _YieldTransferWidgetState extends State<YieldTransferWidget> {
  late YieldTransferModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YieldTransferModel());

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
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 4.0,
        sigmaY: 6.0,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
        child: Material(
          color: Colors.transparent,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Container(
                      width: 75.0,
                      height: 75.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F1FA),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Icon(
                        FFIcons.kyiel,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 35.0,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'zzksedvl' /* Yield Transfer */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'vwrsm07v' /* Send a transfer request to Tra... */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              lineHeight: 1.5,
                            ),
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                  Container(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        Duration(milliseconds: 100),
                        () => safeSetState(() {}),
                      ),
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: FFLocalizations.of(context).getText(
                          'elavjlmv' /* Amount of Money */,
                        ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  lineHeight: 1.0,
                                ),
                        errorStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Tajawal',
                                  color: FlutterFlowTheme.of(context).error,
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        contentPadding: EdgeInsets.all(16.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            lineHeight: 1.0,
                          ),
                      textAlign: TextAlign.center,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_double_arrow_down_rounded,
                    color: Color(0xFFA1A1A1),
                    size: 32.0,
                  ),
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController ??=
                        FormFieldController<String>(
                      _model.dropDownValue ??=
                          FFLocalizations.of(context).getText(
                        '0ddcmhwj' /* Custom Wallet */,
                      ),
                    ),
                    options: [
                      FFLocalizations.of(context).getText(
                        'v3sjvnyy' /* Custom Wallet */,
                      ),
                      FFLocalizations.of(context).getText(
                        'a85x6n9l' /* Trading Wallet */,
                      ),
                      FFLocalizations.of(context).getText(
                        '9lr8kigt' /* Stock Wallet */,
                      )
                    ],
                    onChanged: (val) =>
                        safeSetState(() => _model.dropDownValue = val),
                    width: double.infinity,
                    height: 50.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          lineHeight: 1.0,
                        ),
                    hintText: FFLocalizations.of(context).getText(
                      'yxbuz7je' /* Choose Wallet */,
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderWidth: 1.0,
                    borderRadius: 16.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isOverButton: true,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(
                        builder: (context) => FFButtonWidget(
                          onPressed: ((_model.textController.text == '') ||
                                  (_model.dropDownValue == null ||
                                      _model.dropDownValue == ''))
                              ? null
                              : () async {
                                  var mailRecordReference =
                                      MailRecord.collection.doc();
                                  await mailRecordReference
                                      .set(createMailRecordData(
                                    to: 'tradeyplus@gmail.com',
                                    message: createMailMessageStruct(
                                      subject:
                                          'Transfer Request From ${currentUserDisplayName}',
                                      html: (String userName,
                                              String userEmail,
                                              String transferAmount,
                                              String userWallet) {
                                        return "Dear TradeyPlus," +
                                            "<br>" +
                                            "My name is $userName and my email is $userEmail. I would like to request a transfer of " +
                                            transferAmount +
                                            " USD " +
                                            "to my " +
                                            userWallet +
                                            " wallet." +
                                            "<br>" +
                                            "Sincerely," +
                                            "<br>" +
                                            userName;
                                      }(
                                          currentUserDisplayName,
                                          currentUserEmail,
                                          _model.textController.text,
                                          _model.dropDownValue!),
                                      clearUnsetFields: false,
                                      create: true,
                                    ),
                                  ));
                                  _model.outputCreateDocMail =
                                      MailRecord.getDocumentFromData(
                                          createMailRecordData(
                                            to: 'tradeyplus@gmail.com',
                                            message: createMailMessageStruct(
                                              subject:
                                                  'Transfer Request From ${currentUserDisplayName}',
                                              html: (String userName,
                                                      String userEmail,
                                                      String transferAmount,
                                                      String userWallet) {
                                                return "Dear TradeyPlus," +
                                                    "<br>" +
                                                    "My name is $userName and my email is $userEmail. I would like to request a transfer of " +
                                                    transferAmount +
                                                    " USD " +
                                                    "to my " +
                                                    userWallet +
                                                    " wallet." +
                                                    "<br>" +
                                                    "Sincerely," +
                                                    "<br>" +
                                                    userName;
                                              }(
                                                  currentUserDisplayName,
                                                  currentUserEmail,
                                                  _model.textController.text,
                                                  _model.dropDownValue!),
                                              clearUnsetFields: false,
                                              create: true,
                                            ),
                                          ),
                                          mailRecordReference);
                                  Navigator.pop(context);
                                  await showDialog(
                                    barrierColor: Color(0x28000000),
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: SuccessDialogWidget(),
                                      );
                                    },
                                  );

                                  safeSetState(() {});
                                },
                          text: FFLocalizations.of(context).getText(
                            'wh6834yv' /* Transfer */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  lineHeight: 1.0,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                            disabledColor: Color(0xFFA1A1A1),
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: FFLocalizations.of(context).getText(
                          'nz57qpu5' /* Cancel */,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    lineHeight: 1.0,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ],
                  ),
                ].divide(SizedBox(height: 20.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
