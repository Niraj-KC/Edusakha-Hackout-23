import 'dart:async';

import 'package:apnashakha/UserAuth/User.dart';
import 'package:flutter/material.dart';
import 'package:apnashakha/main.dart';

import '../UserAuth/tokenValidation.dart';
import '../mainScreens/homeScreen.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User user = User();

  bool isValid = false;

  @override
  void initState() {
    AuthTokenVerification(user);

    Timer(Duration(seconds: 5), () {
      print("time out");
      setState(() {
        isValid = user.isAuthorized;
        print("initiated ${isValid.runtimeType} $isValid");
      });

      if(isValid){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
      else Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));



    });


    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red,
                // CustomThemeData.hexStringToColors("f4d5f6"),
                Colors.pink
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,

            )
        ),

        child: Center(child: Text("Splash Screen", style: TextStyle(fontSize: 40),),),
      ),
    );
  }
}
