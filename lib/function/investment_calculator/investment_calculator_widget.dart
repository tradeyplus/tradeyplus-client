import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'investment_calculator_model.dart';
export 'investment_calculator_model.dart';

class InvestmentCalculatorWidget extends StatefulWidget {
  const InvestmentCalculatorWidget({super.key});

  static String routeName = 'InvestmentCalculator';
  static String routePath = '/investmentCalculator';

  @override
  State<InvestmentCalculatorWidget> createState() =>
      _InvestmentCalculatorWidgetState();
}

class _InvestmentCalculatorWidgetState
    extends State<InvestmentCalculatorWidget> {
  late InvestmentCalculatorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InvestmentCalculatorModel());

    _model.monthlyAmountTextController ??= TextEditingController();
    _model.monthlyAmountFocusNode ??= FocusNode();
    _model.monthlyAmountFocusNode!.addListener(
      () async {
        _model.billFocused = false;
        _model.profitFocused = true;
        safeSetState(() {});
      },
    );
    _model.billAmountTextController ??= TextEditingController();
    _model.billAmountFocusNode ??= FocusNode();
    _model.billAmountFocusNode!.addListener(
      () async {
        _model.billFocused = true;
        _model.profitFocused = false;
        safeSetState(() {});
      },
    );
    _model.yieldPercentageTextController ??= TextEditingController();
    _model.yieldPercentageFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.yieldPercentageTextController?.text =
              FFLocalizations.of(context).getText(
            '4zujzxgg' /* Yield Percentage (8%) */,
          );
        }));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0x32E45604), Color(0x4C26577C)],
                stops: [0.4, 0.8],
                begin: AlignmentDirectional(1.0, 0.87),
                end: AlignmentDirectional(-1.0, -0.87),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'v3x568tj' /* Investment Calculator */,
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Inter',
                            fontSize: 21.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            lineHeight: 1.5,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'zwhvq5l9' /* Total Profit */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xA3000000),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        TextFormField(
                          controller: _model.monthlyAmountTextController,
                          focusNode: _model.monthlyAmountFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.monthlyAmountTextController',
                            Duration(milliseconds: 100),
                            () async {
                              if (_model.monthlyAmountTextController.text ==
                                      '') {
                                safeSetState(() {
                                  _model.billAmountTextController?.text = '0';
                                });
                              } else {
                                safeSetState(() {
                                  _model.billAmountTextController?.text =
                                      formatNumber(
                                    double.parse(_model
                                            .monthlyAmountTextController.text) /
                                        (0.08 *
                                            () {
                                              if (_model.dropDownValue == 3) {
                                                return 3.0;
                                              } else if (_model.dropDownValue ==
                                                  6) {
                                                return 6.0;
                                              } else if (_model.dropDownValue ==
                                                  9) {
                                                return 9.0;
                                              } else {
                                                return 12.0;
                                              }
                                            }()),
                                    formatType: FormatType.custom,
                                    currency: '\$',
                                    format: '0.00',
                                    locale: 'en_US',
                                  );
                                });
                              }
                            },
                          ),
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 21.0,
                                  letterSpacing: 0.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'a9jox3tw' /* $0 */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 50.0,
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 50.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                          maxLength: 7,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          buildCounter: (context,
                                  {required currentLength,
                                  required isFocused,
                                  maxLength}) =>
                              null,
                          keyboardType: TextInputType.number,
                          validator: _model.monthlyAmountTextControllerValidator
                              .asValidator(context),
                        ),
                      ].divide(SizedBox(height: 25.0)),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: double.infinity,
                    height: 400.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 30.0, 20.0, 30.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller:
                                          _model.billAmountTextController,
                                      focusNode: _model.billAmountFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.billAmountTextController',
                                        Duration(milliseconds: 100),
                                        () async {
                                          if (_model.billAmountTextController
                                                      .text ==
                                                  '') {
                                            safeSetState(() {
                                              _model.monthlyAmountTextController
                                                  ?.text = '0';
                                            });
                                          } else {
                                            safeSetState(() {
                                              _model.monthlyAmountTextController
                                                  ?.text = formatNumber(
                                                double.parse(_model
                                                        .billAmountTextController
                                                        .text) *
                                                    0.08 *
                                                    () {
                                                      if (_model
                                                              .dropDownValue ==
                                                          3) {
                                                        return 3.0;
                                                      } else if (_model
                                                              .dropDownValue ==
                                                          6) {
                                                        return 6.0;
                                                      } else if (_model
                                                              .dropDownValue ==
                                                          9) {
                                                        return 9.0;
                                                      } else {
                                                        return 12.0;
                                                      }
                                                    }(),
                                                formatType: FormatType.custom,
                                                currency: '\$',
                                                format: '0.00',
                                                locale: 'en_US',
                                              );
                                            });
                                          }
                                        },
                                      ),
                                      autofocus: true,
                                      textCapitalization:
                                          TextCapitalization.none,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'qdr3u0ir' /* Bill Amount */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 21.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              lineHeight: 1.25,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        errorStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Tajawal',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                        contentPadding: EdgeInsets.all(16.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 21.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            lineHeight: 2.0,
                                          ),
                                      maxLength: 7,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.enforced,
                                      buildCounter: (context,
                                              {required currentLength,
                                              required isFocused,
                                              maxLength}) =>
                                          null,
                                      keyboardType: TextInputType.number,
                                      validator: _model
                                          .billAmountTextControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[0-9]'))
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE0E0E0),
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller: _model
                                              .yieldPercentageTextController,
                                          focusNode:
                                              _model.yieldPercentageFocusNode,
                                          autofocus: true,
                                          readOnly: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: false,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Tajawal',
                                                      letterSpacing: 0.0,
                                                    ),
                                            errorStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      fontSize: 18.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                            filled: true,
                                            fillColor: Colors.transparent,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: Color(0xFF6D6D6D),
                                                fontSize: 21.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                lineHeight: 1.5,
                                              ),
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .yieldPercentageTextControllerValidator
                                              .asValidator(context),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp('[0-9]'))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                FlutterFlowDropDown<int>(
                                  controller: _model.dropDownValueController ??=
                                      FormFieldController<int>(
                                    _model.dropDownValue ??= 3,
                                  ),
                                  options: List<int>.from([3, 6, 9, 12]),
                                  optionLabels: [
                                    FFLocalizations.of(context).getText(
                                      '96jr92mg' /* 3 Months */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'skhle4hw' /* 6 Months */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'i8q4ed1d' /* 9 Months */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'iwwzomol' /* 12 Months */,
                                    )
                                  ],
                                  onChanged: (val) async {
                                    safeSetState(
                                        () => _model.dropDownValue = val);
                                    if (_model.billFocused == true) {
                                      safeSetState(() {
                                        _model.monthlyAmountTextController
                                            ?.text = formatNumber(
                                          double.parse(_model
                                                  .billAmountTextController
                                                  .text) *
                                              0.08 *
                                              () {
                                                if (_model.dropDownValue == 3) {
                                                  return 3.0;
                                                } else if (_model
                                                        .dropDownValue ==
                                                    6) {
                                                  return 6.0;
                                                } else if (_model
                                                        .dropDownValue ==
                                                    9) {
                                                  return 9.0;
                                                } else {
                                                  return 12.0;
                                                }
                                              }(),
                                          formatType: FormatType.custom,
                                          currency: '\$',
                                          format: '0.00',
                                          locale: 'en_US',
                                        );
                                      });
                                    } else if (_model.profitFocused == true) {
                                      safeSetState(() {
                                        _model.billAmountTextController?.text =
                                            formatNumber(
                                          double.parse(_model
                                                  .monthlyAmountTextController
                                                  .text) /
                                              (0.08 *
                                                  () {
                                                    if (_model.dropDownValue ==
                                                        3) {
                                                      return 3.0;
                                                    } else if (_model
                                                            .dropDownValue ==
                                                        6) {
                                                      return 6.0;
                                                    } else if (_model
                                                            .dropDownValue ==
                                                        9) {
                                                      return 9.0;
                                                    } else {
                                                      return 12.0;
                                                    }
                                                  }()),
                                          formatType: FormatType.custom,
                                          currency: '\$',
                                          format: '0.00',
                                          locale: 'en_US',
                                        );
                                      });
                                    } else {
                                      safeSetState(() {
                                        _model.monthlyAmountTextController
                                            ?.text = formatNumber(
                                          double.parse(_model
                                                  .billAmountTextController
                                                  .text) *
                                              0.08 *
                                              () {
                                                if (_model.dropDownValue == 3) {
                                                  return 3.0;
                                                } else if (_model
                                                        .dropDownValue ==
                                                    6) {
                                                  return 6.0;
                                                } else if (_model
                                                        .dropDownValue ==
                                                    9) {
                                                  return 9.0;
                                                } else {
                                                  return 12.0;
                                                }
                                              }(),
                                          formatType: FormatType.custom,
                                          currency: '\$',
                                          format: '0.00',
                                          locale: 'en_US',
                                        );
                                      });
                                    }
                                  },
                                  width: double.infinity,
                                  height: 65.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 21.0,
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'ujv7ojr1' /* Period */,
                                  ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 30.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 1.0,
                                  borderRadius: 16.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ].divide(SizedBox(height: 20.0)),
                            ),
                          ].divide(SizedBox(height: 35.0)),
                        ),
                      ),
                    ),
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
