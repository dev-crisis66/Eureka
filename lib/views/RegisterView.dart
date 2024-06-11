import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eureka/components/CustomButton.dart';
import 'package:eureka/models/Section.dart';
import 'package:eureka/models/User.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController email =
      TextEditingController(text: "test@gmail.com");

  final TextEditingController password =
      TextEditingController(text: "test6666");

  final TextEditingController confirmPassword =
      TextEditingController(text: "test6666");

  final formKey = GlobalKey<FormState>();

  late bool hasError = false;
  late bool passwordIcon = false;
  late String selectedSection = "";
  late List<DocumentSnapshot> sections = List.empty(growable: true);

  late String errorMsg = "";

  @override
  void initState() {
    SectionModel.getSections().then((value) {
      sections = value.docs;
      selectedSection = sections.first.id;
    });
    super.initState();
  }

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
                      'Email',
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
                          "Section",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Utils.orange,
                            fontSize: 18,
                          ),
                        ),
                        DropdownButton<String>(
                          isExpanded: true,
                          focusColor: Utils.orange,
                          dropdownColor: Utils.darkGrey,
                          value: selectedSection,
                          items: sections.map((element) => DropdownMenuItem(value: element.id,child: Text(element['label'], style: const TextStyle(color: Utils.white),),)).toList(), onChanged: (String? value) => {
                          setState(() {
                            selectedSection = value!;
                          })
                        })
                      ],
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
                      height: 20,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Confirmation mot de passe',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Utils.orange,
                            fontSize: 18,
                          ),
                        ),
                        TextFormField(
                            autofocus: true,
                            controller: confirmPassword,
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
                                  size: 0,
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
                                  password.text.isNotEmpty &&
                                  confirmPassword.text.isNotEmpty &&
                                  selectedSection.isNotEmpty &&
                                  password.text == confirmPassword.text) {
                                UserModel.register(
                                    "", "", email.text, password.text, selectedSection);
                                Get.offNamed("/test");
                              } else {
                                setState(() {
                                  hasError = true;
                                  errorMsg = "T'es serieux là !";
                                });
                              }
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
