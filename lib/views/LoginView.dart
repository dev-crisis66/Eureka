import 'package:eureka/core/database.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  Database database = Database();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: email,
                ),
                TextFormField(
                  obscureText: true,
                  controller: password,
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // print(database.signIn(email.text, password.text));
                  database.signIn("test@gmail.com", "test6666");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logged !')),
                  );
                }
              },
              child: const Text("Connexion"))
        ],
      )),
    );
  }
}
