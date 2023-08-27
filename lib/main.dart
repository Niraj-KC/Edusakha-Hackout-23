import 'dart:async';

import 'package:apnashakha/appStartingScreens/register.dart';
import 'package:apnashakha/appStartingScreens/splashScreen.dart';
import 'package:apnashakha/mainScreens/homeScreen.dart';
import 'package:apnashakha/reusable_Widgets/colors.dart';
import 'package:flutter/material.dart' ;
import 'package:shared_preferences/shared_preferences.dart';

import 'appStartingScreens/login.dart';

String BASE_URL = "http://172.20.10.3:7676";

void main()
{
  runApp(myApp()) ;
}

class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {


  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: SplashScreen(),
      // home: HomeScreen(),
    );
  }
}


