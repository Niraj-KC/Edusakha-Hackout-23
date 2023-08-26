import 'package:apnashakha/appStartingScreens/login.dart';
import 'package:apnashakha/reusable_Widgets/colors.dart';
import 'package:flutter/material.dart';

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
                  Padding(
                    padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.02 ),
                    child: Container(
                        child: Column(
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height*0.30,) ,
                            Text("REGISTER",style: TextStyle(fontSize: 40,color: Colors.white),) ,
                            SizedBox(height: MediaQuery.of(context).size.height*0.01,) ,
                            Text("Already have an Account ? ",style: TextStyle(color: Colors.white),),
                            SizedBox(height: MediaQuery.of(context).size.height*0.02,) ,
                            ElevatedButton(onPressed: (){

                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen())) ;
                            }, child: Text("Login"))
                          ],
                        ),
                      ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.08,),
                  Container(
                    width: MediaQuery.of(context).size.width*0.7,
                    height: MediaQuery.of(context).size.height*0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft:Radius.circular(20)),
                      color: AppColors.theme["loginc"],
                    ),
                    child: Row(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left : 32.0,top: 40),
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.2,
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
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                              Padding(
                                padding: EdgeInsets.only(left : 32.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.2,
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
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                              Padding(
                                padding: EdgeInsets.only(left : 32.0),
                                child: Container(

                                  width: MediaQuery.of(context).size.width*0.2,
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
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                              Padding(
                                padding: EdgeInsets.only(left : 32.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.2,
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
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ) ,

                ],
              ),
            )
          )
        ),
    );
  }
}
