import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zuzoon/screen/CommunityFirst_screen.dart';
import 'package:zuzoon/screen/Event_screen.dart';
import 'package:zuzoon/screen/Profile_Screen.dart';

import '../model/User_data.dart';
import 'Setting_screen.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  User? user = FirebaseAuth.instance.currentUser;
  User_data login_user = User_data();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("user")
        .doc(user!.uid)
        .get()
        .then(((value) {
      this.login_user = User_data.fromMap(value.data());
      setState(() {});
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: SafeArea(
          //app bar
          child: Column(
            children: [
              Container(
                height: 120,
                // width: 400,
                decoration: BoxDecoration(
                    color: Colors.deepPurple[400],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            //setting
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return setting_page();
                                }));
                              },
                              child: Icon(
                                Icons.settings_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                            )
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //home
                          Text(
                            'Home',
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  //user pic
                  // Stack(children: [
                  //   Container(
                  //     height: 130,
                  //     width: 130,
                  //     decoration: BoxDecoration(
                  //         //color: Colors.deepPurple[200],
                  //         borderRadius: BorderRadius.all(Radius.circular(180))),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(0),
                  //       child: CircleAvatar(
                  //         radius: 75,
                  //         backgroundColor: Colors.grey[300],
                  //         backgroundImage:
                  //             NetworkImage('${login_user.pic}'),
                  //       ),
                  //     ),
                  //   ),
                  // ]),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  //username
                  Text(
                    '${login_user.username}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey[900]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //name
                  Text(
                    '${login_user.firstName} ${login_user.lastName}',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[400],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 41,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //proflie
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/profile');
                                  },
                                  child: Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border: Border.all(
                                          color: Colors.blueGrey, width: 3),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Icon(
                                          Icons.face_rounded,
                                          color: Colors.teal[400],
                                          size: 65,
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Profile',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.grey[300]),
                                )
                              ],
                            ),
                            //event
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return event_page();
                                    }));
                                  },
                                  child: Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border: Border.all(
                                          color: Colors.blueGrey, width: 3),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Icon(
                                          Icons.calendar_today_rounded,
                                          color: Colors.teal[400],
                                          size: 65,
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Event',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.grey[300]))
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //community
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/community');
                                  },
                                  child: Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border: Border.all(
                                          color: Colors.blueGrey, width: 3),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Icon(
                                          Icons.group_rounded,
                                          color: Colors.teal[400],
                                          size: 65,
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Community',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.grey[300]))
                              ],
                            ),
                            //add friend
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/test');
                                  },
                                  child: Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border: Border.all(
                                          color: Colors.blueGrey, width: 3),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Icon(
                                          Icons.person_add_alt_rounded,
                                          color: Colors.teal[400],
                                          size: 65,
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Add friends',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.grey[300]))
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 56,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
