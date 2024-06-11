import 'package:cloud_firestore/cloud_firestore.dart';

class Survey {
  late String uid;
  late String subject;
  late String duration;
  late String endDate;
  late String creatorId;

  Survey(this.uid, this.subject, this.duration, this.endDate, this.creatorId);

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'subject': subject,
      'duration': duration,
      'end_date': endDate,
      'creator_id': creatorId,
    };
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getSurveys() {
    return FirebaseFirestore.instance
        .collection("surveys").snapshots();
  }
}
