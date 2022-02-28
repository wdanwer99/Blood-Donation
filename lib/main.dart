// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use

import 'dart:ui';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/registration/Login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.deepOrange,
          canvasColor: Colors.grey.shade200,
          //background color for the app
          fontFamily: 'Schyler',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              subtitle1: TextStyle(
                fontSize: 15,
                fontFamily: 'Schyler',
                fontWeight: FontWeight.bold,
              )),
        ),
        home: AnimatedSplashScreen(
          duration: 1000,
          splash: Image.asset("assets/Splash.png"),
          nextScreen: Login(),
          splashTransition: SplashTransition.slideTransition,
          backgroundColor: Colors.white,
        ));
  }
}
