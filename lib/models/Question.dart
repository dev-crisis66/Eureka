import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  late String uid;
  late String sondageId;
  late String label;

  QuestionModel(this.uid, this.sondageId, this.label);

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'sondageId': sondageId,
      'label': label,
    };
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getQuestions() {
    return FirebaseFirestore.instance.collection("questions").snapshots();
  }

  static void add(Map<String, dynamic> questionData) {
    FirebaseFirestore.instance.collection("questions").add(questionData);
  }

  static void update(String questionId, Map<String, dynamic> questionData) {
    FirebaseFirestore.instance
        .doc("questions/$questionId")
        .update(questionData);
  }

  static void delete(String questionId) {
    FirebaseFirestore.instance.doc("questions/$questionId").delete();
  }
}
