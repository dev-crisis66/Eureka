import 'package:flutter/material.dart';

class HomeViewWidget extends StatefulWidget {
  const HomeViewWidget({super.key});

  @override
  State<HomeViewWidget> createState() => _HomevViewWidgetState();
}

class _HomevViewWidgetState extends State<HomeViewWidget> {
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
                      child: IconButton(
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () async {},
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      child: Text('Créer un sondage'),
                    ),
                  ],
                ),
              ),
              Text(
                'Sondages disponibles',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
