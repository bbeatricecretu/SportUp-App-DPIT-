import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './UI/screens/home_screen.dart';
import './UI/screens/add_event_screen.dart';
import './UI/screens/profile_screen.dart';
import 'UI/screens/login/sign_in_screen.dart';
import 'UI/screens/login/sign_up_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/sign_up",
      routes: {
        "/": (context) => HomeScreen(),
        "/add_event": (context) => AddEventScreen(),
        "/profile": (context) => ProfileScreen(),
        "/sign_in": (context) => SignInScreen(),
        "/sign_up": (context) => SignUpScreen(),
      },
    );
  }
}
