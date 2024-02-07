import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/success_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'deposit_model.dart';
export 'deposit_model.dart';

class DepositWidget extends StatefulWidget {
  const DepositWidget({super.key});

  @override
  State<DepositWidget> createState() => _DepositWidgetState();
}

class _DepositWidgetState extends State<DepositWidget> {
  late DepositModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DepositModel());

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
    context.watch<FFAppState>();

    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 4.0,
        sigmaY: 6.0,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Container(
                          width: 78.0,
                          height: 74.32,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F1FA),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(-0.3, 0.0),
                            child: Icon(
                              FFIcons.kdeposit,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 35.0,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '6ytiluww' /* Request Deposit */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'q9qjcgg9' /* Send a deposit request to Trad... */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  lineHeight: 1.5,
                                ),
                          ),
                        ].divide(const SizedBox(height: 10.0)),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 18.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'wgqjlfu4' /* Amount of Money */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  lineHeight: 1.0,
                                ),
                            errorStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Tajawal',
                                  color: FlutterFlowTheme.of(context).error,
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
                            contentPadding: const EdgeInsets.all(16.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 1.0,
                                  ),
                          textAlign: TextAlign.center,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Builder(
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
                                              'Deposit Request From $currentUserDisplayName',
                                          html: (String userName,
                                                  String userEmail,
                                                  String depositAmount) {
                                            return "Dear TradeyPlus,<br>My name is $userName and my email is $userEmail. I would like to request a deposit of $depositAmount USD to my TradeyPlus account.<br>Sincerely,<br>$userName";
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
                                                      'Deposit Request From $currentUserDisplayName',
                                                  html: (String userName,
                                                          String userEmail,
                                                          String depositAmount) {
                                                    return "Dear TradeyPlus,<br>My name is $userName and my email is $userEmail. I would like to request a deposit of $depositAmount USD to my TradeyPlus account.<br>Sincerely,<br>$userName";
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
                                        barrierColor: Colors.transparent,
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: const AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: const SuccessDialogWidget(),
                                          );
                                        },
                                      ).then((value) => setState(() {}));

                                      setState(() {});
                                    },
                              text: FFLocalizations.of(context).getText(
                                '8qdqp60o' /* Deposit */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.white,
                                      lineHeight: 1.0,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                                disabledColor: const Color(0xFFA1A1A1),
                              ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            text: FFLocalizations.of(context).getText(
                              '7d1b1ekq' /* Cancel */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).secondary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    lineHeight: 1.0,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ],
                      ),
                    ].divide(const SizedBox(height: 20.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
