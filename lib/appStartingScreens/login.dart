import 'package:apnashakha/reusable_Widgets/colors.dart';
import 'package:flutter/material.dart' ;
import 'package:apnashakha/reusable_Widgets/colors.dart' ;


class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {

  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: AppColors.theme["bg"],
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40) ,
            ),
            child: Center(
              child: SizedBox(
                width: 250,
                height: 500,

                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40) ,
                    color: AppColors.theme["logincot"],
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/images/login_phot.png"),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02,) ,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.01 ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor:  AppColors.theme['white'],
                            hintText: "Enter Username",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:  AppColors.theme['white'],
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:  AppColors.theme['white'],
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.01),
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor:  AppColors.theme['white'],
                            hintText: "Enter Password",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:  AppColors.theme['white'],
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:  AppColors.theme['white'],
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              icon: Icon(
                                _showPassword ? Icons.visibility_off : Icons.visibility,
                                color:  Colors.black,
                              ),
                            ),
                          ),
                          obscureText: !_showPassword,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                      Row(
                        children: [
                          Text("Don't have Account ? ") , 
                          TextButton(onPressed: (){}, child:Text("Register",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {

                        },
                        child: Text('Login',style: TextStyle(color: Colors.black),),
                        style: ElevatedButton.styleFrom(
                          primary:  AppColors.theme['loginc'],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
