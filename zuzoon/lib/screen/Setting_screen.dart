import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zuzoon/screen/Setting_account_screen.dart';

import 'Home_screen.dart';
import 'Login_screen.dart';

class setting_page extends StatefulWidget {
  const setting_page({Key? key}) : super(key: key);

  @override
  State<setting_page> createState() => _setting_pageState();
}

class _setting_pageState extends State<setting_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
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
                      SizedBox(
                        width: 10,
                      )
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //setting
                    Text(
                      'Setting',
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
        SizedBox(
          height: 40,
        ),

        //account
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return settingAccount_page();
            }));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Icon(
                              Icons.account_circle_rounded,
                              color: Colors.deepPurple[400],
                              size: 30,
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Account',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.grey[800]),
                            )),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.grey[800],
                          size: 20,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),

        //change password
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Icon(
                            Icons.vpn_key_rounded,
                            color: Colors.deepPurple[400],
                            size: 30,
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Change Password',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey[800]),
                          )),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey[800],
                        size: 20,
                      )),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),

        //noti
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Icon(
                            Icons.notifications_rounded,
                            color: Colors.deepPurple[400],
                            size: 30,
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Notification',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey[800]),
                          )),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey[800],
                        size: 20,
                      )),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),

        //priva
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Icon(
                            Icons.lock_outline_rounded,
                            color: Colors.deepPurple[400],
                            size: 30,
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Privacy',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey[800]),
                          )),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey[800],
                        size: 20,
                      )),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        //lang
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 40),
        //   child: Container(
        //     height: 60,
        //     width: double.infinity,
        //     decoration: BoxDecoration(
        //         color: Colors.white,
        //         border: Border.all(color: Colors.white),
        //         borderRadius: BorderRadius.circular(12)),
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 20),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Row(
        //             children: [
        //               Padding(
        //                   padding: const EdgeInsets.symmetric(vertical: 10),
        //                   child: Icon(
        //                     Icons.g_translate_rounded,
        //                     color: Colors.deepPurple[400],
        //                     size: 30,
        //                   )),
        //               SizedBox(
        //                 width: 20,
        //               ),
        //               Padding(
        //                   padding: const EdgeInsets.symmetric(vertical: 10),
        //                   child: Text(
        //                     'Language',
        //                     style: TextStyle(
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 15,
        //                         color: Colors.grey[800]),
        //                   )),
        //             ],
        //           ),
        //           Row(
        //             children: [
        //               Padding(
        //                   padding: const EdgeInsets.symmetric(vertical: 10),
        //                   child: Text(
        //                     'EN',
        //                     style: TextStyle(
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 15,
        //                         color: Colors.teal[400]),
        //                   )),
        //               Padding(
        //                   padding: const EdgeInsets.symmetric(vertical: 10),
        //                   child: Text(
        //                     '|',
        //                     style: TextStyle(
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 15,
        //                         color: Colors.grey[800]),
        //                   )),
        //               Padding(
        //                   padding: const EdgeInsets.symmetric(vertical: 10),
        //                   child: Text(
        //                     'TH',
        //                     style: TextStyle(
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 15,
        //                         color: Colors.grey[800]),
        //                   )),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        SizedBox(
          height: 40,
        ),

        //log uot
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
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: ((context) => login_page())));
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
