import 'package:cloud_firestore/cloud_firestore.dart';

class UserResponse {
  late String uid;
  late String userId;
  late String possibleChoiceId;

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'user_id': userId,
      'possible_choice_id': possibleChoiceId
    };
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getUserResponses() {
    return FirebaseFirestore.instance
        .collection("user_responses").snapshots();
  }
}
