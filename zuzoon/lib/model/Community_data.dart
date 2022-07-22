import 'dart:ffi';

class Community_data {
  String? c_id;
  String? c_title;
  String? c_desciption;
  List? c_userList;
  List? c_eventList;

  Community_data({
    this.c_id,
    this.c_title,
    this.c_desciption,
    this.c_userList,
    this.c_eventList,
  });

  // receiving data form server
  factory Community_data.fromMap(map) {
    return Community_data(
      c_id: map['c_id'],
      c_title: map['c_title'],
      c_desciption: map['c_desciption'],
      c_userList: map['c_userList'],
      c_eventList: map['c_eventList'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'c_id': c_id,
      'c_title': c_title,
      'c_desciption': c_desciption,
      'c_userList': c_userList,
      'c_eventList': c_eventList,
    };
  }

  // sending data to our server
  Map<String, dynamic> toJson() => {
        'c_id': c_id,
        'c_title': c_title,
        'c_desciption': c_desciption,
        'c_userList': c_userList,
        'c_eventList': c_eventList,
      };

  // receiving data form server
  static Community_data formJson(Map<String, dynamic> json) => Community_data(
        c_id: json['c_id'],
        c_title: json['c_title'],
        c_desciption: json['c_desciption'],
        c_userList: json['c_userList'],
        c_eventList: json['c_eventList'],
      );
}
