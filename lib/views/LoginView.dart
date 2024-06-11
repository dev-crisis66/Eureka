import 'package:eureka/components/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils.dart';

class LoginViewWidget extends StatefulWidget {
  const LoginViewWidget({super.key});

  @override
  State<LoginViewWidget> createState() => _LoginViewWidgetState();
}

class _LoginViewWidgetState extends State<LoginViewWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Utils.darkGrey,
      body: Stack(
        children: [
          Container(
            alignment: AlignmentDirectional(0, 0),
            child: Image.asset(
              'images/register.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              width: 300.0,
              child: Form(
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 160,
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Utils.orange,
                        fontSize: 18,
                      ),
                    ),
                    TextFormField(
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: UnderlineInputBorder(
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
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mot de passe',
                          style: TextStyle(
                            color: Utils.orange,
                            fontSize: 18,
                          ),
                        ),
                        TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
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
                              onTap: () => (),
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
                    Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color(0x00FFFFFF),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(80, 0, 80, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomButton(
                            onPressed: () {
                              Get.toNamed('/home');
                            },
                            backgroundColor: Utils.orange,
                            text: 'Se connecter',
                            textColor: Colors.white,
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: InkWell(
                              onTap: () async {},
                              child: Text(
                                'S\'inscrire',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0x00FFFFFF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
