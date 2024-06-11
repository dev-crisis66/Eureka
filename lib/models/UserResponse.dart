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
    return FirebaseFirestore.instance.collection("user_responses").snapshots();
  }

  static void add(Map<String, dynamic> userResponseData) {
    FirebaseFirestore.instance
        .collection("user_responses")
        .add(userResponseData);
  }

  static void update(
      String userResponsesId, Map<String, dynamic> userResponseData) {
    FirebaseFirestore.instance
        .doc("user_responses/$userResponsesId")
        .update(userResponseData);
  }

  static void delete(String userResponsesId) {
    FirebaseFirestore.instance.doc("user_responses/$userResponsesId").delete();
  }
}
