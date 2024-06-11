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

  static Future<QuerySnapshot<Map<String, dynamic>>> getSections() {
    return FirebaseFirestore.instance.collection("sections").get();
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getSectionByLabel(
      String label) {
    return FirebaseFirestore.instance
        .collection("sections")
        .where("label", isEqualTo: label).limit(1).get();
  }

  static void add(Map<String, dynamic> sectionData) {
    FirebaseFirestore.instance.collection("sections").add(sectionData);
  }

  static void update(String sectionId, Map<String, dynamic> sectionData) {
    FirebaseFirestore.instance.doc("sections/$sectionId").update(sectionData);
  }

  static void delete(String sectionId) {
    FirebaseFirestore.instance.doc("sections/$sectionId").delete();
  }
}
