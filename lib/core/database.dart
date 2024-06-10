import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eureka/models/User.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  register(firstname, lastname, emailAddress, password, sectionId) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      UserModel user =
          UserModel(credential.user!.uid, firstname, lastname, sectionId);
      FirebaseFirestore.instance
          .collection("users")
          .add(user.toMap());
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'weak-password') {
        print('Le mot de passe est trop faible !');
      } else if (e.code == 'email-already-in-use') {
        print('Un compte avec cette adresse mail existe déjà !');
      }
    } catch (e) {
      print(e);
    }
  }

  signIn(emailAddress, password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("Pas d'utilisateur avec cet email");
      } else if (e.code == 'wrong-password') {
        print('Mauvais mot de passe');
      }
    }
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUsers() {
    return FirebaseFirestore.instance
        .collection("users").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getSurveys() {
    return FirebaseFirestore.instance
        .collection("surveys").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getQuestions() {
    return FirebaseFirestore.instance
        .collection("surveys").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getResponses() {
    return FirebaseFirestore.instance
        .collection("surveys").snapshots();
  }
}
