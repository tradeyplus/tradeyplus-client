import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'barchart_model.dart';
export 'barchart_model.dart';

class BarchartWidget extends StatefulWidget {
  const BarchartWidget({
    super.key,
    int? rows,
  }) : rows = rows ?? 3;

  final int rows;

  @override
  State<BarchartWidget> createState() => _BarchartWidgetState();
}

class _BarchartWidgetState extends State<BarchartWidget> {
  late BarchartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BarchartModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.isLoaded = false;
      });
      _model.investmentDocList = await queryInvestmentDataRecordOnce(
        queryBuilder: (investmentDataRecord) => investmentDataRecord
            .where(
              'investor_ref',
              isEqualTo: currentUserReference,
            )
            .where(
              'created_time',
              isLessThan: getCurrentTimestamp,
            ),
      );
      setState(() {
        _model.investmentDataList = functions
            .getPeriodicData(_model.investmentDocList!.toList(), 3)
            .toList()
            .cast<InvestmentDataMapStruct>();
      });
      setState(() {
        _model.depositList = functions
            .getBarchartData(
                _model.investmentDataList
                    .where((e) => e.transactionType == TransactionType.PROFIT)
                    .toList()
                    .sortedList((e) => e.createdTime!)
                    .map((e) => e.amount)
                    .toList()
                    .toList(),
                _model.investmentDataList
                    .where((e) => e.transactionType == TransactionType.DEPOSIT)
                    .toList()
                    .sortedList((e) => e.createdTime!)
                    .map((e) => e.amount)
                    .toList()
                    .toList(),
                true)
            .toList()
            .cast<double>();
        _model.profitList = functions
            .getBarchartData(
                _model.investmentDataList
                    .where((e) => e.transactionType == TransactionType.PROFIT)
                    .toList()
                    .sortedList((e) => e.createdTime!)
                    .map((e) => e.amount)
                    .toList()
                    .toList(),
                _model.investmentDataList
                    .where((e) => e.transactionType == TransactionType.DEPOSIT)
                    .toList()
                    .sortedList((e) => e.createdTime!)
                    .map((e) => e.amount)
                    .toList()
                    .toList(),
                false)
            .toList()
            .cast<double>();
        _model.monthlyDuration = 3;
      });
      setState(() {
        _model.isLoaded = true;
      });
    });
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
    final chartPieChartColorsList1 = [
      FlutterFlowTheme.of(context).primary,
      FlutterFlowTheme.of(context).secondary
    ];
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Builder(
            builder: (context) {
              if (_model.isLoaded == true) {
                return Visibility(
                  visible: responsiveVisibility(
                    context: context,
                    tabletLandscape: false,
                    desktop: false,
                  ),
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(
                      maxHeight: 852.0,
                    ),
                    decoration: const BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'alt2v3w0' /* Financial Report */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 21.0,
                                    fontWeight: FontWeight.w600,
                                    lineHeight: 1.5,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 40.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 6.0,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              setState(() {
                                                _model.investmentDataList = functions
                                                    .getPeriodicData(
                                                        _model
                                                            .investmentDocList!
                                                            .toList(),
                                                        3)
                                                    .toList()
                                                    .cast<
                                                        InvestmentDataMapStruct>();
                                              });
                                              setState(() {
                                                _model.depositList = functions
                                                    .getBarchartData(
                                                        _model
                                                            .investmentDataList
                                                            .where((e) =>
                                                                e.transactionType ==
                                                                TransactionType
                                                                    .PROFIT)
                                                            .toList()
                                                            .sortedList((e) =>
                                                                e.createdTime!)
                                                            .map(
                                                                (e) => e.amount)
                                                            .toList(),
                                                        _model
                                                            .investmentDataList
                                                            .where((e) =>
                                                                e.transactionType ==
                                                                TransactionType
                                                                    .DEPOSIT)
                                                            .toList()
                                                            .sortedList((e) =>
                                                                e.createdTime!)
                                                            .map(
                                                                (e) => e.amount)
                                                            .toList(),
                                                        true)
                                                    .toList()
                                                    .cast<double>();
                                                _model.profitList = functions
                                                    .getBarchartData(
                                                        _model
                                                            .investmentDataList
                                                            .where((e) =>
                                                                e.transactionType ==
                                                                TransactionType
                                                                    .PROFIT)
                                                            .toList()
                                                            .sortedList((e) =>
                                                                e.createdTime!)
                                                            .map(
                                                                (e) => e.amount)
                                                            .toList(),
                                                        _model
                                                            .investmentDataList
                                                            .where((e) =>
                                                                e.transactionType ==
                                                                TransactionType
                                                                    .DEPOSIT)
                                                            .toList()
                                                            .sortedList((e) =>
                                                                e.createdTime!)
                                                            .map(
                                                                (e) => e.amount)
                                                            .toList(),
                                                        false)
                                                    .toList()
                                                    .cast<double>();
                                                _model.monthlyDuration = 3;
                                              });
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'd5zhii8w' /* 3 Months */,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: _model.monthlyDuration == 3
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: _model
                                                                .monthlyDuration ==
                                                            3
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 0.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 1.0, 0.0, 1.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  setState(() {
                                                    _model.investmentDataList =
                                                        functions
                                                            .getPeriodicData(
                                                                _model
                                                                    .investmentDocList!
                                                                    .toList(),
                                                                6)
                                                            .toList()
                                                            .cast<
                                                                InvestmentDataMapStruct>();
                                                  });
                                                  setState(() {
                                                    _model.depositList = functions
                                                        .getBarchartData(
                                                            _model
                                                                .investmentDataList
                                                                .where((e) =>
                                                                    e.transactionType ==
                                                                    TransactionType
                                                                        .PROFIT)
                                                                .toList()
                                                                .sortedList((e) => e
                                                                    .createdTime!)
                                                                .map((e) =>
                                                                    e.amount)
                                                                .toList(),
                                                            _model
                                                                .investmentDataList
                                                                .where((e) =>
                                                                    e.transactionType ==
                                                                    TransactionType
                                                                        .DEPOSIT)
                                                                .toList()
                                                                .sortedList((e) => e
                                                                    .createdTime!)
                                                                .map((e) =>
                                                                    e.amount)
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<double>();
                                                    _model.profitList = functions
                                                        .getBarchartData(
                                                            _model
                                                                .investmentDataList
                                                                .where((e) =>
                                                                    e.transactionType ==
                                                                    TransactionType
                                                                        .PROFIT)
                                                                .toList()
                                                                .sortedList((e) => e
                                                                    .createdTime!)
                                                                .map((e) =>
                                                                    e.amount)
                                                                .toList(),
                                                            _model
                                                                .investmentDataList
                                                                .where((e) =>
                                                                    e.transactionType ==
                                                                    TransactionType
                                                                        .DEPOSIT)
                                                                .toList()
                                                                .sortedList((e) => e
                                                                    .createdTime!)
                                                                .map((e) =>
                                                                    e.amount)
                                                                .toList(),
                                                            false)
                                                        .toList()
                                                        .cast<double>();
                                                    _model.monthlyDuration = 6;
                                                  });
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'w2pey891' /* 6 Months */,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: _model
                                                              .monthlyDuration ==
                                                          6
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: _model
                                                                        .monthlyDuration ==
                                                                    6
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                          ),
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              setState(() {
                                                _model.investmentDataList = functions
                                                    .getPeriodicData(
                                                        _model
                                                            .investmentDocList!
                                                            .toList(),
                                                        12)
                                                    .toList()
                                                    .cast<
                                                        InvestmentDataMapStruct>();
                                              });
                                              setState(() {
                                                _model.depositList = functions
                                                    .getBarchartData(
                                                        _model
                                                            .investmentDataList
                                                            .where((e) =>
                                                                e.transactionType ==
                                                                TransactionType
                                                                    .PROFIT)
                                                            .toList()
                                                            .sortedList((e) =>
                                                                e.createdTime!)
                                                            .map(
                                                                (e) => e.amount)
                                                            .toList(),
                                                        _model
                                                            .investmentDataList
                                                            .where((e) =>
                                                                e.transactionType ==
                                                                TransactionType
                                                                    .DEPOSIT)
                                                            .toList()
                                                            .sortedList((e) =>
                                                                e.createdTime!)
                                                            .map(
                                                                (e) => e.amount)
                                                            .toList(),
                                                        true)
                                                    .toList()
                                                    .cast<double>();
                                                _model.profitList = functions
                                                    .getBarchartData(
                                                        _model
                                                            .investmentDataList
                                                            .where((e) =>
                                                                e.transactionType ==
                                                                TransactionType
                                                                    .PROFIT)
                                                            .toList()
                                                            .sortedList((e) =>
                                                                e.createdTime!)
                                                            .map(
                                                                (e) => e.amount)
                                                            .toList(),
                                                        _model
                                                            .investmentDataList
                                                            .where((e) =>
                                                                e.transactionType ==
                                                                TransactionType
                                                                    .DEPOSIT)
                                                            .toList()
                                                            .sortedList((e) =>
                                                                e.createdTime!)
                                                            .map(
                                                                (e) => e.amount)
                                                            .toList(),
                                                        false)
                                                    .toList()
                                                    .cast<double>();
                                                _model.monthlyDuration = 12;
                                              });
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'ystj5cfm' /* 12 Months */,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: _model.monthlyDuration ==
                                                      12
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: _model
                                                                .monthlyDuration ==
                                                            12
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 0.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 10.0)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 30.0, 5.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (_model.selectedChart == false)
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'ixnt6vsp' /* Bar Chart */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                lineHeight: 1.5,
                                              ),
                                        ),
                                      if (_model.selectedChart == true)
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'qs28zna4' /* Pie Chart */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                lineHeight: 1.5,
                                              ),
                                        ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 3.0,
                                                color: Color(0x33000000),
                                                offset: Offset(0.0, 1.0),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              if (_model.selectedChart == true)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          7.0, 0.0, 7.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      setState(() {
                                                        _model.selectedChart =
                                                            false;
                                                      });
                                                    },
                                                    child: Container(
                                                      constraints:
                                                          const BoxConstraints(
                                                        maxWidth: 50.0,
                                                      ),
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  0.0),
                                                        ),
                                                        child: Image.asset(
                                                          'assets/images/Vector_(1).png',
                                                          width: 35.0,
                                                          height: 35.0,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (_model.selectedChart == false)
                                                ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(8.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/Frame_70_(2).png',
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              if (_model.selectedChart == true)
                                                ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(8.0),
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/Frame_70_(3).png',
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              if (_model.selectedChart == false)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          7.0, 0.0, 7.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      setState(() {
                                                        _model.selectedChart =
                                                            true;
                                                      });
                                                    },
                                                    child: Container(
                                                      constraints:
                                                          const BoxConstraints(
                                                        maxWidth: 50.0,
                                                      ),
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/pie_chart.png',
                                                          width: 35.0,
                                                          height: 35.0,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'f53kzi9r' /* Total Balance */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Tajawal',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.w500,
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            valueOrDefault<String>(
                                              formatNumber(
                                                valueOrDefault(
                                                    currentUserDocument
                                                        ?.balance,
                                                    0.0),
                                                formatType: FormatType.custom,
                                                currency: '\$',
                                                format: '0.00',
                                                locale: 'en_US',
                                              ),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Tajawal',
                                                  fontSize: 32.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
                                  child: Stack(
                                    children: [
                                      if (_model.selectedChart == true)
                                        SizedBox(
                                          width: double.infinity,
                                          height: 265.0,
                                          child: Stack(
                                            children: [
                                              FlutterFlowPieChart(
                                                data: FFPieChartData(
                                                  values: _model
                                                      .investmentDataList
                                                      .where((e) =>
                                                          (e.transactionType !=
                                                              TransactionType
                                                                  .COMMISSION) &&
                                                          (e.transactionType !=
                                                              TransactionType
                                                                  .WITHDRAW))
                                                      .toList()
                                                      .sortedList(
                                                          (e) => e.createdTime!)
                                                      .map((e) => e.amount)
                                                      .toList(),
                                                  colors:
                                                      chartPieChartColorsList1,
                                                  radius: [25.0],
                                                  borderColor: [
                                                    Colors.transparent
                                                  ],
                                                ),
                                                donutHoleRadius: 100.0,
                                                donutHoleColor:
                                                    Colors.transparent,
                                                sectionLabelType:
                                                    PieChartSectionLabelType
                                                        .value,
                                                sectionLabelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                labelFormatter: LabelFormatter(
                                                  numberFormat: (val) =>
                                                      formatNumber(
                                                    val,
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType:
                                                        DecimalType.automatic,
                                                    currency: '\$',
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    1.0, 1.2),
                                                child:
                                                    FlutterFlowChartLegendWidget(
                                                  entries: _model
                                                      .investmentDataList
                                                      .where((e) =>
                                                          (e.transactionType !=
                                                              TransactionType
                                                                  .COMMISSION) &&
                                                          (e.transactionType !=
                                                              TransactionType
                                                                  .WITHDRAW))
                                                      .toList()
                                                      .sortedList(
                                                          (e) => e.createdTime!)
                                                      .map((e) =>
                                                          e.transactionTypeStr)
                                                      .toList()
                                                      .asMap()
                                                      .entries
                                                      .map(
                                                        (label) => LegendEntry(
                                                          chartPieChartColorsList1[
                                                              label.key %
                                                                  chartPieChartColorsList1
                                                                      .length],
                                                          label.value,
                                                        ),
                                                      )
                                                      .toList(),
                                                  width: 100.0,
                                                  height: 60.0,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium,
                                                  textPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(5.0, 0.0,
                                                              0.0, 0.0),
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 5.0, 0.0),
                                                  borderWidth: 1.0,
                                                  borderColor:
                                                      Colors.transparent,
                                                  indicatorSize: 10.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (_model.selectedChart == false)
                                        SizedBox(
                                          width: double.infinity,
                                          height: 265.0,
                                          child: FlutterFlowBarChart(
                                            barData: [
                                              FFBarChartData(
                                                yData: _model.depositList,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderWidth: 0.0,
                                                borderColor: Colors.transparent,
                                              ),
                                              FFBarChartData(
                                                yData: _model.profitList,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              )
                                            ],
                                            xLabels: List.generate(
                                                random_data.randomInteger(2, 2),
                                                (index) =>
                                                    random_data.randomString(
                                                      8,
                                                      8,
                                                      true,
                                                      true,
                                                      false,
                                                    )),
                                            barWidth: 15.0,
                                            barBorderRadius:
                                                BorderRadius.circular(8.0),
                                            barSpace: 0.0,
                                            groupSpace: 0.0,
                                            alignment:
                                                BarChartAlignment.spaceAround,
                                            chartStylingInfo: ChartStylingInfo(
                                              enableTooltip: true,
                                              tooltipBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              backgroundColor:
                                                  Colors.transparent,
                                              showGrid: true,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              borderWidth: 1.0,
                                            ),
                                            axisBounds: const AxisBounds(
                                              minY: 0.0,
                                              maxY: 20000.0,
                                            ),
                                            xAxisLabelInfo: const AxisLabelInfo(),
                                            yAxisLabelInfo: AxisLabelInfo(
                                              showLabels: true,
                                              labelTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 7.5,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                              labelInterval: 5000.0,
                                              labelFormatter: LabelFormatter(
                                                numberFormat: (val) =>
                                                    formatNumber(
                                                  val,
                                                  formatType:
                                                      FormatType.compact,
                                                  currency: '\$',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  height: 40.0,
                                  thickness: 1.0,
                                  color: Color(0x24000000),
                                ),
                                ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0x404B5195),
                                            Color(0x3FEF9E6E)
                                          ],
                                          stops: [0.0, 0.58],
                                          begin:
                                              AlignmentDirectional(0.03, 1.0),
                                          end:
                                              AlignmentDirectional(-0.03, -1.0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 7.5, 10.0, 7.5),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: 35.0,
                                                      height: 35.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .keyboard_double_arrow_up_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            size: 18.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'l45bdi9c' /* Deposit */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                lineHeight: 1.5,
                                                              ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'm5hy7gag' /* N/A */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Tajawal',
                                                                color: const Color(
                                                                    0xFF00B016),
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                lineHeight: 1.0,
                                                              ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 10.0)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Text(
                                                formatNumber(
                                                  functions.addInvestmentAmount(
                                                      _model
                                                          .investmentDataList
                                                          .where((e) =>
                                                              e.transactionType ==
                                                              TransactionType
                                                                  .DEPOSIT)
                                                          .toList()
                                                          .map((e) => e.amount)
                                                          .toList()),
                                                  formatType: FormatType.custom,
                                                  currency: '\$',
                                                  format: '0.00',
                                                  locale: 'en_US',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0x3F4B5195),
                                            Color(0x58EF9E6E)
                                          ],
                                          stops: [0.0, 0.8],
                                          begin:
                                              AlignmentDirectional(0.02, 1.0),
                                          end:
                                              AlignmentDirectional(-0.02, -1.0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 7.5, 10.0, 7.5),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: 35.0,
                                                      height: 35.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Icon(
                                                        Icons
                                                            .trending_up_rounded,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 18.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'oznaeblg' /* Yield */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                lineHeight: 1.5,
                                                              ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '3xcght3w' /* +1.24% */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Tajawal',
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                lineHeight: 1.0,
                                                              ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 10.0)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Text(
                                                formatNumber(
                                                  functions.addInvestmentAmount(
                                                      _model
                                                          .investmentDataList
                                                          .where((e) =>
                                                              e.transactionType ==
                                                              TransactionType
                                                                  .PROFIT)
                                                          .toList()
                                                          .map((e) => e.amount)
                                                          .toList()),
                                                  formatType: FormatType.custom,
                                                  currency: '\$',
                                                  format: '0.00',
                                                  locale: 'en_US',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0x3F4B5195),
                                            Color(0x58EF9E6E)
                                          ],
                                          stops: [0.0, 0.8],
                                          begin:
                                              AlignmentDirectional(0.02, 1.0),
                                          end:
                                              AlignmentDirectional(-0.02, -1.0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: 35.0,
                                                      height: 35.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Icon(
                                                        Icons
                                                            .keyboard_double_arrow_down,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 18.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'a95epurh' /* Withdraw */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  lineHeight:
                                                                      1.5,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'yykct3ki' /* N/A */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Tajawal',
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                lineHeight: 1.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                formatNumber(
                                                  functions.addInvestmentAmount(
                                                      _model
                                                          .investmentDataList
                                                          .where((e) =>
                                                              e.transactionType ==
                                                              TransactionType
                                                                  .WITHDRAW)
                                                          .toList()
                                                          .map((e) => e.amount)
                                                          .toList()),
                                                  formatType: FormatType.custom,
                                                  currency: '\$',
                                                  format: '0.00',
                                                  locale: 'en_US',
                                                ),
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0x3F4B5195),
                                            Color(0x58EF9E6E)
                                          ],
                                          stops: [0.0, 0.8],
                                          begin:
                                              AlignmentDirectional(0.02, 1.0),
                                          end:
                                              AlignmentDirectional(-0.02, -1.0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: 35.0,
                                                      height: 35.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Icon(
                                                        Icons.percent_rounded,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 18.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'qx9h91ml' /* Commission */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  lineHeight:
                                                                      1.5,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'tn24h80j' /* +1.24% */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Tajawal',
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                lineHeight: 1.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                formatNumber(
                                                  functions.addInvestmentAmount(
                                                      _model
                                                          .investmentDataList
                                                          .where((e) =>
                                                              e.transactionType ==
                                                              TransactionType
                                                                  .COMMISSION)
                                                          .toList()
                                                          .map((e) => e.amount)
                                                          .toList()),
                                                  formatType: FormatType.custom,
                                                  currency: '\$',
                                                  format: '0.00',
                                                  locale: 'en_US',
                                                ),
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 15.0)),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 20.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Container(
                                width: double.infinity,
                                constraints: const BoxConstraints(
                                  maxHeight: 350.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Builder(
                                  builder: (context) {
                                    final currentInvestmentDataList = _model
                                        .investmentDataList
                                        .where((e) =>
                                            e.transactionType !=
                                            TransactionType.COMMISSION)
                                        .toList()
                                        .sortedList((e) => e.createdTime!)
                                        .toList();
                                    return FlutterFlowDataTable<
                                        InvestmentDataMapStruct>(
                                      controller:
                                          _model.paginatedDataTableController,
                                      data: currentInvestmentDataList,
                                      columnsBuilder: (onSortChanged) => [
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'd6rxr02m' /* Date */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Tajawal',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          fixedWidth:
                                              MediaQuery.sizeOf(context).width *
                                                  0.13,
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'sl69n0g5' /* Deposit */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Tajawal',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          fixedWidth:
                                              MediaQuery.sizeOf(context).width *
                                                  0.16,
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'w253ubyi' /* Yield */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Tajawal',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          fixedWidth:
                                              MediaQuery.sizeOf(context).width *
                                                  0.12,
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'wi6zknvq' /* % */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Tajawal',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          fixedWidth:
                                              MediaQuery.sizeOf(context).width *
                                                  0.08,
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'xgerrqro' /* Withdraw */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Tajawal',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          fixedWidth:
                                              MediaQuery.sizeOf(context).width *
                                                  0.17,
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'tuwj0467' /* Balance */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Tajawal',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          fixedWidth:
                                              MediaQuery.sizeOf(context).width *
                                                  0.17,
                                        ),
                                      ],
                                      dataRowBuilder:
                                          (currentInvestmentDataListItem,
                                                  currentInvestmentDataListIndex,
                                                  selected,
                                                  onSelectChanged) =>
                                              DataRow(
                                        color: MaterialStateProperty.all(
                                          currentInvestmentDataListIndex % 2 ==
                                                  0
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryBackground
                                              : const Color(0x1FE45604),
                                        ),
                                        cells: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              dateTimeFormat(
                                                'd/M/y',
                                                currentInvestmentDataListItem
                                                    .createdTime!,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Tajawal',
                                                        fontSize: 11.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          Visibility(
                                            visible:
                                                currentInvestmentDataListItem
                                                        .transactionType ==
                                                    TransactionType.DEPOSIT,
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                formatNumber(
                                                  currentInvestmentDataListItem
                                                      .amount,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                  currency: '\$',
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Tajawal',
                                                          fontSize: 11.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible:
                                                currentInvestmentDataListItem
                                                        .transactionType ==
                                                    TransactionType.PROFIT,
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                formatNumber(
                                                  currentInvestmentDataListItem
                                                      .amount,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                  currency: '\$',
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Tajawal',
                                                          fontSize: 11.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible:
                                                currentInvestmentDataListItem
                                                        .transactionType ==
                                                    TransactionType.PROFIT,
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                formatNumber(
                                                  currentInvestmentDataListItem
                                                          .amount /
                                                      functions.addInvestmentAmount(_model
                                                          .investmentDataList
                                                          .where((e) =>
                                                              e.transactionType ==
                                                              TransactionType
                                                                  .DEPOSIT)
                                                          .toList()
                                                          .map((e) => e.amount)
                                                          .toList()),
                                                  formatType:
                                                      FormatType.percent,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Tajawal',
                                                          fontSize: 11.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible:
                                                currentInvestmentDataListItem
                                                        .transactionType ==
                                                    TransactionType.WITHDRAW,
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                formatNumber(
                                                  currentInvestmentDataListItem
                                                      .amount,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                  currency: '\$',
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Tajawal',
                                                          fontSize: 11.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              formatNumber(
                                                currentInvestmentDataListItem
                                                    .investorBalance,
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.automatic,
                                                currency: '\$',
                                              ),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Tajawal',
                                                        fontSize: 11.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ].map((c) => DataCell(c)).toList(),
                                      ),
                                      paginated: false,
                                      selectable: false,
                                      width: double.infinity,
                                      headingRowHeight: 56.0,
                                      dataRowHeight: 48.0,
                                      columnSpacing: 5.0,
                                      headingRowColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(12.0),
                                      addHorizontalDivider: true,
                                      horizontalDividerColor: const Color(0x1FE45604),
                                      horizontalDividerThickness: 0.5,
                                      addVerticalDivider: true,
                                      verticalDividerColor: const Color(0x1FE45604),
                                      verticalDividerThickness: 0.5,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Lottie.asset(
                    'assets/lottie_animations/barchart.json',
                    width: 150.0,
                    height: 130.0,
                    fit: BoxFit.contain,
                    animate: true,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
