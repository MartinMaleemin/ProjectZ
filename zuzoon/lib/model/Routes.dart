import 'package:flutter/material.dart';
import 'package:zuzoon/screen/AddEvent_screnn.dart';
import 'package:zuzoon/screen/CommunityCreate_screen.dart';
import 'package:zuzoon/screen/CommunityFirst_screen.dart';
import 'package:zuzoon/screen/Community_screen.dart';
import 'package:zuzoon/screen/Event_screen.dart';
import 'package:zuzoon/screen/ForgetPassword_screen.dart';
import 'package:zuzoon/screen/Home_screen.dart';
import 'package:zuzoon/screen/Login_screen.dart';
import 'package:zuzoon/screen/Profile_Screen.dart';
import 'package:zuzoon/screen/Register_screen.dart';
import 'package:zuzoon/screen/Setting_screen.dart';
import 'package:zuzoon/screen/test%20Even.dart';
import 'package:zuzoon/screen/test.dart';

final Map<String, WidgetBuilder> routes = {
  '/login': (BuildContext context) => login_page(),
  '/register': (BuildContext context) => register_page(),
  '/forgetpass': (BuildContext context) => forgetPassword_page(),
  '/homepage': (BuildContext context) => home_page(),
  '/profile': (BuildContext context) => profile_page(),
  '/setting': (BuildContext context) => setting_page(),
  '/event': (BuildContext context) => event_page(),
  '/addEvent': (BuildContext context) => addEvent_page(),
  '/community': (BuildContext context) => community_page(),
  '/createCommunity': (BuildContext context) => createCommunity_page(),
  '/test': (BuildContext context) => Calendar()
};
