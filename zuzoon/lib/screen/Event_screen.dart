import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zuzoon/model/User_data.dart';
import 'package:zuzoon/screen/AddEvent_screnn.dart';
import 'package:table_calendar/table_calendar.dart';

class event_page extends StatefulWidget {
  const event_page({Key? key}) : super(key: key);

  @override
  State<event_page> createState() => _event_pageState();
}

class _event_pageState extends State<event_page> {
  CalendarFormat format = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(children: [
            //app bar
            Container(
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.deepPurple[400],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //back
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),

                          //add event
                          GestureDetector(
                            onTap: () {
                              // showDialog(context: context,
                              // builder: (context =))
                              Navigator.pushNamed(context, '/addEvent');
                            },
                            child: Icon(
                              Icons.add_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //community
                        Text(
                          'Event',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ])),
        ));
  }
}
