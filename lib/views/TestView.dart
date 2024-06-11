import 'package:eureka/components/TestTile.dart';
import 'package:flutter/material.dart';

import '../models/User.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Text("Tests ! "),
        Expanded(
            child: StreamBuilder(
                stream: UserModel.getUsers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    int count = snapshot.data!.docs.length;
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          return const TestTile();
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: count);
                  } else if (!snapshot.hasData ||
                      snapshot.data!.docs.isEmpty) {
                    return const CircularProgressIndicator();
                  }else{
                    return const Text("Aucunes informations trouvées !");
                  }
                }))
      ],
    ));
  }
}
