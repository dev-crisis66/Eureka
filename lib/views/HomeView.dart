import 'package:eureka/components/CustomButton.dart';
import 'package:eureka/components/HomeCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils.dart';

class HomeViewWidget extends StatefulWidget {
  const HomeViewWidget({super.key});

  @override
  State<HomeViewWidget> createState() => _HomeViewWidgetState();
}

class _HomeViewWidgetState extends State<HomeViewWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Utils.darkGrey,
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
                        onPressed: () {
                          Get.toNamed('/profile');
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      child: CustomButton(
                        text: 'Créer un sondage',
                        backgroundColor: Utils.orange,
                        textColor: Utils.white,
                        onPressed: () {
                          Get.toNamed('/anonyme');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Sondages disponibles',
                style: TextStyle(
                  color: Utils.white,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      HomeCardWidget(),
                      HomeCardWidget(),
                      HomeCardWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
