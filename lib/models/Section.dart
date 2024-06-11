import 'package:cloud_firestore/cloud_firestore.dart';

class SectionModel {
  late String uid;
  late String label;

  SectionModel(this.uid, this.label);

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'label': label,
    };
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getSections() {
    return FirebaseFirestore.instance
        .collection("sections").snapshots();
  }
}
