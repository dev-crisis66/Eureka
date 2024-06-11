import 'package:cloud_firestore/cloud_firestore.dart';

class ResponsesModel {
  late String uid;
  late String label;
  late String questionId;
  late String choiceType;

  ResponsesModel(this.uid, this.label, this.questionId, this.choiceType);

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'label': label,
      'question_id': questionId,
      'choice_type': choiceType,
    };
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getResponses() {
    return FirebaseFirestore.instance
        .collection("responses").snapshots();
  }
}
