import 'package:eureka/models/User.dart';
import 'package:flutter/material.dart';

class TestTile extends StatelessWidget {
  late UserModel user;
  TestTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        UserModel.delete(user.uid);
      },
      title: Text(user.firstname.isEmpty ? "Un mec qui se croit drole !" : user.firstname),
    );
  }
}
