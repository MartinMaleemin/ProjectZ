import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zuzoon/model/firebaseStorage_service.dart';
import 'package:zuzoon/screen/Home_screen.dart';
import 'package:zuzoon/screen/Setting_screen.dart';
import 'package:zuzoon/model/Routes.dart';
import 'package:zuzoon/model/firebaseStorage_service.dart';

import '../model/User_data.dart';
import 'Login_screen.dart';

class profile_page extends StatefulWidget {
  const profile_page({Key? key}) : super(key: key);

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
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
      body: SafeArea(
          child: Column(children: [
        //app bar
        Container(
          height: 300,
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
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(180))),
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
                              color: Colors.grey[200]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),

        //name
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Text(
                      'First Name',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey[800]),
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Text(
                      '${login_user.firstName}',
                      style: TextStyle(fontSize: 15, color: Colors.grey[650]),
                    )),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),

        //lastname
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Text(
                      'Last Name',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey[800]),
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Text(
                      '${login_user.lastName}',
                      style: TextStyle(fontSize: 15, color: Colors.grey[650]),
                    )),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),

        //date of birth
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Text(
                      'Birth Day',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey[800]),
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Text(
                      '${login_user.birthday}',
                      style: TextStyle(fontSize: 15, color: Colors.grey[650]),
                    )),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),

        //email
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Text(
                      'Email',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey[800]),
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Text(
                      '${login_user.email}',
                      style: TextStyle(fontSize: 15, color: Colors.grey[650]),
                    )),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        //qr code
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'My QR Code',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey[800]),
                    )),
                Padding(
                    padding: const EdgeInsets.all(20),
                    child:
                        Icon(Icons.qr_code_rounded, color: Colors.grey[800])),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),

        //log out btm
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: GestureDetector(
            onTap: () async {
              await FirebaseAuth.instance.signOut().then((value) {
                Fluttertoast.showToast(
                  msg: "See you SOON.",
                  gravity: ToastGravity.TOP,
                );
              });
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.teal[400],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'Log out',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.grey[200],
                  ),
                ),
              ),
            ),
          ),
        ),
      ])),
    );
  }
}
