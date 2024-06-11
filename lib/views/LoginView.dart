import 'package:eureka/models/User.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  final String email = "test@gmail.com";
  final String password = "test6666";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
            UserModel.signIn(email, password);
          }, child: const Text("Connexion", style: TextStyle(fontFamily: "Inter"),))
        ],
      ),
    );
  }
}
