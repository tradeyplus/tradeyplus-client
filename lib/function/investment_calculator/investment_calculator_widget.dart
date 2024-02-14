import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'investment_calculator_model.dart';
export 'investment_calculator_model.dart';

class InvestmentCalculatorWidget extends StatefulWidget {
  const InvestmentCalculatorWidget({super.key});

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

    _model.monthlyAmountController ??= TextEditingController();
    _model.monthlyAmountFocusNode ??= FocusNode();
    _model.monthlyAmountFocusNode!.addListener(
      () async {
        setState(() {
          _model.billFocused = false;
          _model.profitFocused = true;
        });
      },
    );
    _model.billAmountController ??= TextEditingController();
    _model.billAmountFocusNode ??= FocusNode();
    _model.billAmountFocusNode!.addListener(
      () async {
        setState(() {
          _model.billFocused = true;
          _model.profitFocused = false;
        });
      },
    );
    _model.yieldPercentageController ??= TextEditingController();
    _model.yieldPercentageFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.yieldPercentageController?.text =
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
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
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
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'v3x568tj' /* Investment Calculator */,
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Inter',
                            fontSize: 21.0,
                            fontWeight: FontWeight.bold,
                            lineHeight: 1.5,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
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
                                    color: const Color(0xA3000000),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        TextFormField(
                          controller: _model.monthlyAmountController,
                          focusNode: _model.monthlyAmountFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.monthlyAmountController',
                            const Duration(milliseconds: 100),
                            () async {
                              if (_model.monthlyAmountController.text == '') {
                                setState(() {
                                  _model.billAmountController?.text = '0';
                                });
                              } else {
                                setState(() {
                                  _model.billAmountController?.text =
                                      formatNumber(
                                    double.parse(_model
                                            .monthlyAmountController.text) /
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
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 21.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'a9jox3tw' /* $0 */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 50.0,
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
                          validator: _model.monthlyAmountControllerValidator
                              .asValidator(context),
                        ),
                      ].divide(const SizedBox(height: 25.0)),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: double.infinity,
                    height: 400.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
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
                                  decoration: const BoxDecoration(),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: _model.billAmountController,
                                      focusNode: _model.billAmountFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.billAmountController',
                                        const Duration(milliseconds: 100),
                                        () async {
                                          if (_model.billAmountController
                                                      .text ==
                                                  '') {
                                            setState(() {
                                              _model.monthlyAmountController
                                                  ?.text = '0';
                                            });
                                          } else {
                                            setState(() {
                                              _model.monthlyAmountController
                                                  ?.text = formatNumber(
                                                double.parse(_model
                                                        .billAmountController
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
                                              fontWeight: FontWeight.normal,
                                              lineHeight: 1.25,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                            ),
                                        errorStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Tajawal',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
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
                                        contentPadding: const EdgeInsets.all(16.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 21.0,
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
                                          .billAmountControllerValidator
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
                                    color: const Color(0xFFE0E0E0),
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller:
                                              _model.yieldPercentageController,
                                          focusNode:
                                              _model.yieldPercentageFocusNode,
                                          autofocus: true,
                                          readOnly: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
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
                                                color: const Color(0xFF6D6D6D),
                                                fontSize: 21.0,
                                                fontWeight: FontWeight.w500,
                                                lineHeight: 1.5,
                                              ),
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .yieldPercentageControllerValidator
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
                                    setState(() => _model.dropDownValue = val);
                                    if (_model.billFocused == true) {
                                      setState(() {
                                        _model.monthlyAmountController?.text =
                                            formatNumber(
                                          double.parse(_model
                                                  .billAmountController.text) *
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
                                      setState(() {
                                        _model.billAmountController?.text =
                                            formatNumber(
                                          double.parse(_model
                                                  .monthlyAmountController
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
                                      setState(() {
                                        _model.monthlyAmountController?.text =
                                            formatNumber(
                                          double.parse(_model
                                                  .billAmountController.text) *
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
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ].divide(const SizedBox(height: 20.0)),
                            ),
                          ].divide(const SizedBox(height: 35.0)),
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
