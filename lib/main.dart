import 'dart:async';

import 'package:apnashakha/appStartingScreens/register.dart';
import 'package:apnashakha/appStartingScreens/splashScreen.dart';
import 'package:flutter/material.dart' ;
import 'package:shared_preferences/shared_preferences.dart';

import 'appStartingScreens/login.dart';

String BASE_URL = "http://192.168.137.243:7676";

void main()
{
  runApp(myWebApp()) ;
}

class myWebApp extends StatefulWidget {
  const myWebApp({super.key});

  @override
  State<myWebApp> createState() => _myWebAppState();
}

class _myWebAppState extends State<myWebApp> {


  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: SplashScreen(),
    );
  }
}


