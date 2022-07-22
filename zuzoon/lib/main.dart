// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zuzoon/model/User_data.dart';
import 'package:zuzoon/provider/community_provider.dart';
import 'package:zuzoon/screen/Home_screen.dart';
import 'package:zuzoon/screen/Login_screen.dart';
import 'package:zuzoon/screen/Profile_Screen.dart';
import 'package:zuzoon/model/Routes.dart';

String? _intialRoute = '/login';

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then(
    (value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        if (event != null) {
          _intialRoute = '/homepage';
        }
        runApp(MyApp());
      });
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return communityProvider();
        }),
        // ChangeNotifierProvider(create: (context) {
        //   return communityProvider();
        // })
      ],
      child: MaterialApp(
        title: 'ZUZoon',
        // home: home_page(),
        routes: routes,
        initialRoute: _intialRoute,
        theme: ThemeData(
          colorSchemeSeed: Colors.deepPurple[300],
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
