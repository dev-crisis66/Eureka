import 'package:eureka/core/database.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final database = Database();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Column(children: [
        ElevatedButton(onPressed: () {
          database.logout();
        }, child: Text("Deconnexion"))
      ],),
    ),);
  }
}
