import 'package:flutter/material.dart';

class ProfileViewWidget extends StatefulWidget {
  const ProfileViewWidget({super.key});

  @override
  State<ProfileViewWidget> createState() => _ProfileViewWidgetState();
}

class _ProfileViewWidgetState extends State<ProfileViewWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(30, 55, 30, 0),
          child: Text('Profile View'),
        ),
      ),
    );
  }
}
