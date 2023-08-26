import 'package:flutter/material.dart' ;

import 'appStartingScreens/login.dart';

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
  Widget build(BuildContext context) {
    return loginScreen();
  }
}


