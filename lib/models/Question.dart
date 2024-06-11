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
    return FirebaseFirestore.instance
        .collection("questions").snapshots();
  }
}
