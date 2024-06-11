import 'package:flutter/material.dart';

class TestTile extends StatelessWidget {
  const TestTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print('Saluti');
      },
      title: const Text("Test"),
    );
  }
}
