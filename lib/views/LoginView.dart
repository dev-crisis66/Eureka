import 'package:eureka/components/CustomButton.dart';
import 'package:eureka/models/User.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController email = TextEditingController(text: "test@gmail.com");

  final TextEditingController password = TextEditingController(text: "test6666");

  final formKey = GlobalKey<FormState>();

  late bool hasError = false;
  late bool passwordIcon = false;

  late String errorMsg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Utils.darkGrey,
      body: Stack(
        children: [
          Container(
            alignment: const AlignmentDirectional(0, 0),
            child: Image.asset(
              'images/register.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SizedBox(
              width: 300.0,
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 160,
                    ),
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Utils.orange,
                        fontSize: 18,
                      ),
                    ),
                    TextFormField(
                      autofocus: true,
                      controller: email,
                      obscureText: false,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Utils.darkGrey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Utils.orange,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Utils.orange,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: Utils.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Mot de passe',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Utils.orange,
                            fontSize: 18,
                          ),
                        ),
                        TextFormField(
                            autofocus: true,
                            controller: password,
                            obscureText: passwordIcon,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Utils.orange,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Utils.orange,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Utils.orange,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              filled: true,
                              fillColor: Utils.white,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    passwordIcon = !passwordIcon;
                                  });
                                },
                                child: Icon(
                                  passwordIcon
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  size: 22,
                                ),
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: hasError
                          ? Container(
                              width: 300,
                              height: 110,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Utils.darkGrey,
                                  border: Border.all(color: Utils.orange),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8))),
                              child: Text(errorMsg,
                                  style: const TextStyle(
                                      color: Utils.orange, fontSize: 25)),
                            )
                          : Container(
                              width: 300,
                              height: 20,
                              decoration: const BoxDecoration(
                                color: Utils.darkGrey,
                              )),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(80, 0, 80, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomButton(
                            onPressed: () {
                              if (formKey.currentState!.validate() &&
                                  email.text.isNotEmpty &&
                                  password.text.isNotEmpty) {
                                UserModel.signIn(email, password);
                                Get.offNamed("/test");
                              } else {
                                setState(() {
                                  hasError = true;
                                  errorMsg = "T'es serieux là !";
                                });
                              }
                            },
                            backgroundColor: Utils.orange,
                            text: 'Se connecter',
                            textColor: Utils.white,
                          ),
                          const SizedBox(height: 20,),
                          CustomButton(
                            onPressed: () {
                              Get.offNamed("/register");
                            },
                            backgroundColor: Utils.orange,
                            text: "S'enregistrer",
                            textColor: Utils.white,
                          ),
                        ],
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
