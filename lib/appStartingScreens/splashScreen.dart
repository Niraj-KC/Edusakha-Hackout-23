import 'dart:async';

import 'package:apnashakha/UserAuth/User.dart';
import 'package:apnashakha/reusable_Widgets/colors.dart';
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
            color: AppColors.theme['bg'] ,
        ),

        child: Center(child: CircleAvatar(radius: 60,backgroundImage: AssetImage("assets/images/logo.png"),),),
      ),
    );
  }
}
