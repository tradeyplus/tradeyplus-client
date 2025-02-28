import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/success_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'request_withdraw_model.dart';
export 'request_withdraw_model.dart';

class RequestWithdrawWidget extends StatefulWidget {
  const RequestWithdrawWidget({super.key});

  @override
  State<RequestWithdrawWidget> createState() => _RequestWithdrawWidgetState();
}

class _RequestWithdrawWidgetState extends State<RequestWithdrawWidget> {
  late RequestWithdrawModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequestWithdrawModel());

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
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.04, 0.1),
                            child: Icon(
                              FFIcons.kvector,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 14.0,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              FFIcons.kvector1,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 35.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '8pufspr6' /* Request Withdrawal */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'u03z2e37' /* Send a withdrawal request to T... */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).secondaryText,
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
                          'o2ilfdpz' /* Amount of Money */,
                        ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
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
                          ),
                      textAlign: TextAlign.center,
                      maxLength: 7,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      buildCounter: (context,
                              {required currentLength,
                              required isFocused,
                              maxLength}) =>
                          null,
                      keyboardType: TextInputType.number,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          child: Builder(
                            builder: (context) => FFButtonWidget(
                              onPressed: (_model.textController.text == '')
                                  ? null
                                  : () async {
                                      var mailRecordReference =
                                          MailRecord.collection.doc();
                                      await mailRecordReference
                                          .set(createMailRecordData(
                                        to: 'tradeyplus@gmail.com',
                                        message: createMailMessageStruct(
                                          subject:
                                              'Withdrawal Request From ${currentUserDisplayName}',
                                          html: (String userName,
                                                  String userEmail,
                                                  String withdrawalAmount) {
                                            return "Dear TradeyPlus," +
                                                "<br>" +
                                                "My name is $userName and my email is $userEmail. I would like to request a withdrawal of " +
                                                withdrawalAmount +
                                                " USD" +
                                                "<br>" +
                                                "Sincerely," +
                                                "<br>" +
                                                userName;
                                          }(
                                              currentUserDisplayName,
                                              currentUserEmail,
                                              _model.textController.text),
                                          clearUnsetFields: false,
                                          create: true,
                                        ),
                                      ));
                                      _model.outputCreateDocMail =
                                          MailRecord.getDocumentFromData(
                                              createMailRecordData(
                                                to: 'tradeyplus@gmail.com',
                                                message:
                                                    createMailMessageStruct(
                                                  subject:
                                                      'Withdrawal Request From ${currentUserDisplayName}',
                                                  html: (String userName,
                                                          String userEmail,
                                                          String withdrawalAmount) {
                                                    return "Dear TradeyPlus," +
                                                        "<br>" +
                                                        "My name is $userName and my email is $userEmail. I would like to request a withdrawal of " +
                                                        withdrawalAmount +
                                                        " USD" +
                                                        "<br>" +
                                                        "Sincerely," +
                                                        "<br>" +
                                                        userName;
                                                  }(
                                                      currentUserDisplayName,
                                                      currentUserEmail,
                                                      _model
                                                          .textController.text),
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
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: SuccessDialogWidget(),
                                          );
                                        },
                                      );

                                      safeSetState(() {});
                                    },
                              text: FFLocalizations.of(context).getText(
                                '1dctyijw' /* Withdrawal */,
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
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: FFLocalizations.of(context).getText(
                            'scfunpdl' /* Cancel */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).secondary,
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
                          ),
                        ),
                      ],
                    ),
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
