import 'dart:math' as math;
import 'package:flutter/material.dart';

class HomevViewWidget extends StatefulWidget {
  const HomevViewWidget({super.key});

  @override
  State<HomevViewWidget> createState() => _HomevViewWidgetState();
}

class _HomevViewWidgetState extends State<HomevViewWidget> {
  late HomevViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomevViewModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).bleuFonce,
        body: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30, 55, 30, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: FlutterFlowIconButton(
                          borderRadius: 0,
                          borderWidth: 0,
                          buttonSize: 40,
                          fillColor: FlutterFlowTheme.of(context).bleuFonce,
                          icon: FaIcon(
                            FontAwesomeIcons.userAlt,
                            color: FlutterFlowTheme.of(context).blanc,
                            size: 30,
                          ),
                          onPressed: () async {
                            context.pushNamed(
                              'ProfileView',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                  PageTransitionType.rightToLeft,
                                ),
                              },
                            );
                          },
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Créer un sondage',
                        options: FFButtonOptions(
                          height: 40,
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                          iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: FlutterFlowTheme.of(context).orange,
                          textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            letterSpacing: 0,
                          ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Sondages disponibles',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).blanc,
                    fontSize: 24,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                StreamBuilder<List<SurveyRecord>>(
                  stream: querySurveyRecord(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<SurveyRecord> listViewSurveyRecordList =
                    snapshot.data!;
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewSurveyRecordList.length,
                      separatorBuilder: (_, __) => SizedBox(height: 70),
                      itemBuilder: (context, listViewIndex) {
                        final listViewSurveyRecord =
                        listViewSurveyRecordList[listViewIndex];
                        return Stack(
                          children: [
                            Transform.rotate(
                              angle: 10.86 * (math.pi / 180),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                height: 124,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).orange,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: 124,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(8, 5, 8, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            1, 0, 0, 0),
                                        child: Text(
                                          listViewSurveyRecord.subject,
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Inter',
                                            fontSize: 20,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.watch_later_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .bleuFonce,
                                          size: 30,
                                        ),
                                        Align(
                                          alignment:
                                          AlignmentDirectional(-1, 0),
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                1, 0, 0, 0),
                                            child: Text(
                                              '${listViewSurveyRecord.duration.toString()} minutes',
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                color: FlutterFlowTheme.of(
                                                    context)
                                                    .orange,
                                                fontSize: 20,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 5)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.watch_later_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .bleuFonce,
                                          size: 30,
                                        ),
                                        Align(
                                          alignment:
                                          AlignmentDirectional(-1, 0),
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                1, 0, 0, 0),
                                            child: Text(
                                              '${listViewSurveyRecord.endDate?.toString()} h',
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                color: FlutterFlowTheme.of(
                                                    context)
                                                    .orange,
                                                fontSize: 20,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 5)),
                                    ),
                                  ].divide(SizedBox(height: 10)),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ].divide(SizedBox(height: 50)),
            ),
          ),
        ),
      ),
    );
  }
}
