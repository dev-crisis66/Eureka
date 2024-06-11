import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eureka/components/CustomButton.dart';
import 'package:eureka/components/TestTile.dart';
import 'package:eureka/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/User.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Text("Tests ! "),
        CustomButton(
          onPressed: () {
            UserModel.logout();
            Get.offNamed("/login");
          },
          text: "Déconnecte moi !",
        ),
        StreamBuilder(
            stream: UserModel.getUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<DocumentSnapshot> users = snapshot.data!.docs;
                int count = users.length;
                return Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        UserModel user = UserModel.fromMap(users
                            .elementAt(index));
                        return TestTile(user: user);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                      itemCount: count),
                );
              } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const CircularProgressIndicator();
              } else {
                return const Text("Aucunes informations trouvées !");
              }
            })
      ],
    ));
  }
}
