import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
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

        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 60,backgroundImage: AssetImage("assets/images/logo.png"),),
          SizedBox(height: MediaQuery.of(context).size.height*0.1,) ,
          DefaultTextStyle(
            style: TextStyle(
              fontSize: 20.0,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('Edushakha',textStyle: TextStyle(fontSize: 30)),
              ],
              isRepeatingAnimation: true,
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
          ],
        ),),
      ),
    );
  }
}
