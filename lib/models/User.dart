class UserModel {
  late String uid;
  late String firstname;
  late String lastname;
  late String sectionId;

  UserModel(this.uid, this.firstname, this.lastname, this.sectionId);

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstname': firstname,
      'lastname': lastname,
      'section_id': sectionId,
    };
  }
}
