class User_data {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? username;
  String? birthday;
  String? pic;
  String? communityid;
  String? eventid;

  User_data({
    this.uid,
    this.email,
    this.firstName,
    this.lastName,
    this.username,
    this.birthday,
    this.pic,
    this.communityid,
    this.eventid,
  });

  // receiving data form server
  factory User_data.fromMap(map) {
    return User_data(
      birthday: map['birthday'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      uid: map['uid'],
      username: map['username'],
      pic: map['pic'],
      eventid: map['eventid: '],
      communityid: map['communityid'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'birthday': birthday,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'uid': uid,
      'username': username,
      'pic': pic,
      'eventid': eventid,
      'communityid': communityid,
    };
  }

  // sending data to our server
  Map<String, dynamic> toJson() {
    return {
      'birthday': birthday,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'uid': uid,
      'username': username,
      'pic': pic,
      'eventid': eventid,
      'communityid': communityid,
    };
  }
}
