import 'package:apnashakha/UserAuth/User.dart';
import 'package:apnashakha/appStartingScreens/login.dart';
import 'package:apnashakha/reusable_Widgets/colors.dart';
import 'package:flutter/material.dart';

import '../mainScreens/homeScreen.dart';

class StudentRegister extends StatefulWidget {
  const StudentRegister({super.key});

  @override
  State<StudentRegister> createState() => _StudentRegisterState();
}

class _StudentRegisterState extends State<StudentRegister> {
  TextEditingController Name = TextEditingController() ;
  TextEditingController Email = TextEditingController() ;
  TextEditingController SPassword = TextEditingController() ;
  TextEditingController CPassword = TextEditingController() ;
   bool _showPassword1  = false ;
  bool _showPassword2  = false ;
  DateTime? selectedDate;

  void _showdatepicker() async {
    final selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2023),
    );

    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }

  Future signUp () async {
    User user = User(email: Email.text, pwd: CPassword.text, name: Name.text, dob: "12/02/2004", isStudent: true);
    Map<String, dynamic> res = await user.signUp(user);
    print(res);
    bool isCreated = res["responseData"]["created"];
    if(isCreated==true){
      user.storeUser(user);
      user.auth_token = res["responseData"]["token"];
      print(user.auth_token);
      print("stored user");

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }

  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
        backgroundColor: AppColors.theme["bg"],
          body: Container(
            child: Container(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("REGISTER",style: TextStyle(fontSize: 40,color: Colors.white),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02,) ,
                      Container(
                        width: MediaQuery.of(context).size.width*0.7,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor:  AppColors.theme['white'],
                            hintText: "Enter Your Name",
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

                          controller: Name,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                      Container(
                        width: MediaQuery.of(context).size.width*0.7,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor:  AppColors.theme['white'],
                            hintText: "Enter Your Email",
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

                          controller: Email,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                      Container(

                        width: MediaQuery.of(context).size.width*0.7,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor:  AppColors.theme['white'],
                            hintText: "Set Password",
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
                                  _showPassword1 = !_showPassword1;
                                });
                              },
                              icon: Icon(
                                _showPassword1 ? Icons.visibility_off : Icons.visibility,
                                color:  Colors.black,
                              ),
                            ),
                          ),
                          obscureText: !_showPassword1,
                          controller: SPassword,

                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                      Container(
                        width: MediaQuery.of(context).size.width*0.7,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor:  AppColors.theme['white'],
                            hintText: "Confirm Password",
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
                                  _showPassword2 = !_showPassword2;
                                });
                              },
                              icon: Icon(
                                _showPassword2 ? Icons.visibility_off : Icons.visibility,
                                color:  Colors.black,
                              ),
                            ),
                          ),

                          controller: CPassword,
                          obscureText: !_showPassword2,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                      Container(
                        width: MediaQuery.of(context).size.width*0.7,
                        height: 60,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor:  AppColors.theme['white'],
                            hintText: "Choose BirthDate",
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
                            suffixIcon: IconButton(
                              onPressed: () {
                                _showdatepicker();
                                },
                              icon: Icon(
                                Icons.date_range,
                                color:  Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:  AppColors.theme['white'],
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),

                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height*0.01,) ,
                          Text("Already have an Account ? ",style: TextStyle(color: Colors.white),),
                          SizedBox(height: MediaQuery.of(context).size.height*0.02,) ,
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen())) ;
                          }, child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),))
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                            signUp();
                        },
                        child: Text('Register',style: TextStyle(color: Colors.black),),
                        style: ElevatedButton.styleFrom(
                          primary:  AppColors.theme['loginc'],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                        ),
                      ),
                    ],


                  ),

                ),
              ),
            )
          )
        ),
    );
  }
}
