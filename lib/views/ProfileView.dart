import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'profile_view_model.dart';
export 'profile_view_model.dart';

class ProfileViewWidget extends StatefulWidget {
  const ProfileViewWidget({super.key});

  @override
  State<ProfileViewWidget> createState() => _ProfileViewWidgetState();
}

class _ProfileViewWidgetState extends State<ProfileViewWidget> {
  late ProfileViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileViewModel());
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
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30, 55, 30, 0),
            child: FutureBuilder<int>(
              future: querySurveyRecordCount(
                queryBuilder: (surveyRecord) => surveyRecord.where(
                  'creator_id',
                  isEqualTo: currentUserReference,
                ),
              ),
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
                int columnCount = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                              borderColor: Colors.transparent,
                              borderRadius: 0,
                              borderWidth: 0,
                              buttonSize: 40,
                              fillColor: FlutterFlowTheme.of(context).bleuFonce,
                              icon: FaIcon(
                                FontAwesomeIcons.userAlt,
                                color: FlutterFlowTheme.of(context).blanc,
                                size: 30,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                          if (columnCount > 0)
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'Créer un sondage',
                              options: FFButtonOptions(
                                height: 40,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 0, 24, 0),
                                iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: FlutterFlowTheme.of(context).orange,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
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
                          if (columnCount < 1)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('HomevView');
                              },
                              child: Text(
                                '< retour',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Inter',
                                  color:
                                  FlutterFlowTheme.of(context).orange,
                                  fontSize: 15,
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AuthUserStreamWidget(
                            builder: (context) => Text(
                              'Bonjour, ${currentUserDisplayName}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).blanc,
                                fontSize: 24,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            'Vos sondages',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).orange,
                              fontSize: 20,
                              letterSpacing: 0,
                            ),
                          ),
                        ].divide(SizedBox(height: 20)),
                      ),
                    ),
                    if (columnCount < 1)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Text(
                                'Vous n\'avez pas encore de sondages',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).blanc,
                                  fontSize: 24,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            if (columnCount < 1)
                              FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: 'Créer un sondage',
                                options: FFButtonOptions(
                                  height: 40,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  color: FlutterFlowTheme.of(context).orange,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
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
                          ].divide(SizedBox(height: 41)),
                        ),
                      ),
                    StreamBuilder<List<SurveyRecord>>(
                      stream: querySurveyRecord(
                        queryBuilder: (surveyRecord) => surveyRecord.where(
                          'creator_id',
                          isEqualTo: currentUserReference,
                        ),
                      ),
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
                          separatorBuilder: (_, __) => SizedBox(height: 10),
                          itemBuilder: (context, listViewIndex) {
                            final listViewSurveyRecord =
                            listViewSurveyRecordList[listViewIndex];
                            return ListTile(
                              title: Text(
                                listViewSurveyRecord.subject,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 20,
                                  letterSpacing: 0,
                                ),
                              ),
                              subtitle: Text(
                                'Subtitle goes here...',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0,
                                ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color:
                                FlutterFlowTheme.of(context).secondaryText,
                                size: 20,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              dense: false,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        GoRouter.of(context).prepareAuthEvent();
                        await authManager.signOut();
                        GoRouter.of(context).clearRedirectLocation();

                        context.goNamedAuth('LoginView', context.mounted);
                      },
                      text: 'Déconnexion',
                      options: FFButtonOptions(
                        height: 40,
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
                  ].divide(SizedBox(height: 50)),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
