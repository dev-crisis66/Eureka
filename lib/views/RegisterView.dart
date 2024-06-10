import 'package:eureka/core/database.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

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
                TextField(
                  controller: email,
                ),
                TextField(
                  obscureText: true,
                  controller: password,
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  database.register("Test F", "Test L", "test@gmail.com",
                      "test6666", "UUUIIII");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Registered !')),
                  );
                }
              },
              child: const Text("S'enregistrer"))
        ],
      )),
    );
  }
}
