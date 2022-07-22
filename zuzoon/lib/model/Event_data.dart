import 'package:firebase_helpers/firebase_helpers.dart';

class Event_data {
  String? uid;
  String? eventid;
  String? title;
  String? location;
  String? start;
  String? end;
  String? url;
  String? notes;
  bool? noti;

  Event_data({
    this.uid,
    this.eventid,
    this.title,
    this.location,
    this.start,
    this.end,
    this.url,
    this.notes,
    this.noti,
  });

  // receiving data form server
  factory Event_data.fromMap(map) {
    return Event_data(
      uid: map['uid'],
      eventid: map['eventid'],
      title: map['title'],
      location: map['location'],
      start: map['start'],
      end: map['end'],
      url: map['url'],
      notes: map['notes'],
      noti: map['noti'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'eventid': eventid,
      'title': title,
      'location': location,
      'start': start,
      'end': end,
      'url': url,
      'notes': notes,
      'noti': noti,
    };
  }

  
}
