import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegisterViewWidget extends StatefulWidget {
  const RegisterViewWidget({
    super.key,
    this.sectionId,
  });

  final DocumentReference? sectionId;

  @override
  State<RegisterViewWidget> createState() => _RegisterViewWidgetState();
}

class _RegisterViewWidgetState extends State<RegisterViewWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 1,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.asset(
                'assets/images/Inscription_1.png',
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 1,
                fit: BoxFit.cover,
              ),
            ),
            Form(
              autovalidateMode: AutovalidateMode.disabled,
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Text(
                                'Nom',
                              ),
                            ),
                            TextFormField(
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.orange,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueAccent,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Text(
                                'Email',
                              ),
                            ),
                            TextFormField(
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.orange,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                filled: true,
                                fillColor: Colors.blueAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Text(
                                'Mot de passe',
                              ),
                            ),
                            TextFormField(
                              autofocus: true,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.orange,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueAccent,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Text(
                                'Confirmation mot de passe',
                              ),
                            ),
                            TextFormField(
                              autofocus: true,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.orange,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.orange,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: InkWell(
                                  onTap: () {},
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    Icons.visibility_outlined,
                                    size: 22,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(80, 0, 80, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextButton(
                            onPressed: () async {},
                            child: Text('S\'inscrire'),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {},
                              child: Text(
                                'Se connecter',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Opacity(
                      opacity: 0,
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
    );
  }
}
