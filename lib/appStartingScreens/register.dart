import 'package:apnashakha/appStartingScreens/login.dart';
import 'package:apnashakha/reusable_Widgets/colors.dart';
import 'package:flutter/material.dart';

class StudentRegister extends StatefulWidget {
  const StudentRegister({super.key});

  @override
  State<StudentRegister> createState() => _StudentRegisterState();
}

class _StudentRegisterState extends State<StudentRegister> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
        backgroundColor: AppColors.theme["bg"],
          body: Container(
            child: Center(
              child: Row(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Text("REGISTER",style: TextStyle(fontSize: 40),) ,
                        Text("Already have an Account ? "),
                        ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen())) ;
                        }, child: Text("Login"))
                      ],
                    ),
                  ) ,
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft:Radius.circular(20)),
                      color: AppColors.theme["loginc"],
                    ),
                    child: Text("fdfdf"),
                  ) ,

                ],
              ),
            )
          )
        ),
    );
  }
}
