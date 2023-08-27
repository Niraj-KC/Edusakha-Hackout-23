import 'package:apnashakha/appStartingScreens/register.dart';
import 'package:flutter/material.dart';

import '../UserAuth/User.dart';
import '../mainScreens/homeScreen.dart';
import '../reusable_Widgets/colors.dart';
import 'login.dart';
import 'package:image_picker/image_picker.dart' ;
import 'dart:io' ;

class Uniregister extends StatefulWidget {
  const Uniregister({super.key});

  @override
  State<Uniregister> createState() => _UniregisterState();
}

class _UniregisterState extends State<Uniregister> {
  TextEditingController UName = TextEditingController() ;
  TextEditingController Address = TextEditingController() ;
  TextEditingController wadd = TextEditingController() ;
  TextEditingController SPassword = TextEditingController() ;
  TextEditingController CPassword = TextEditingController() ;

  final ImagePicker _picker = ImagePicker();
  XFile ? file ;
  bool _showPassword2  = false ;

  Future signUp () async {
    showDialog(context: context, builder: (context)
    {
      return Center(child: CircularProgressIndicator());
    } ,

    );
    User user = User(email: UName.text, pwd: CPassword.text, isStudent: false, webAdd: wadd.text);
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
      home: Scaffold(
        backgroundColor: AppColors.theme["bg"],

         body:  Container(
              child: Container(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.width*0.1,),
                        Text("University Registration",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,) ,
                        Stack(
                            alignment: Alignment.bottomRight,
                            children:[

                              CircleAvatar(
                                  radius: 100,
                                  backgroundColor:Colors.white,
                                  child: file!=null ? Image.file(File(file!.path),fit:BoxFit.fill )
                                      : Icon(Icons.insert_photo,size: 50,color: Colors.black54,)

                              ),
                              FloatingActionButton(
                                backgroundColor: Colors.black,
                                onPressed: ()async{
                                  final XFile ? gallary = await _picker.pickImage(source: ImageSource.gallery) ;
                                  setState(() {
                                    file = gallary;
                                  });

                                },child: Icon(Icons.edit,color:Colors.white),) ,
                            ]
                        ) ,
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,) ,
                        Container(
                          width: MediaQuery.of(context).size.width*0.8,
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:  AppColors.theme['white'],
                              hintText: "University Name",
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

                            controller: UName,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                        Container(
                          width: MediaQuery.of(context).size.width*0.8,
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:  AppColors.theme['white'],
                              hintText: "Enter Address",
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

                            controller: Address,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                        Container(

                          width: MediaQuery.of(context).size.width*0.8,
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:  AppColors.theme['white'],
                              hintText: "Web Address",
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

                            controller: wadd,

                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                        Container(
                          width: MediaQuery.of(context).size.width*0.8,
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
                                    _showPassword2 = !_showPassword2;
                                  });
                                },
                                icon: Icon(
                                  _showPassword2 ? Icons.visibility_off : Icons.visibility,
                                  color:  Colors.black,
                                ),
                              ),
                            ),

                            controller: SPassword,
                            obscureText: !_showPassword2,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                        Container(
                          width: MediaQuery.of(context).size.width*0.8,
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

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an Account ? ",style: TextStyle(color: Colors.white),),
                            SizedBox(height: MediaQuery.of(context).size.height*0.02,) ,
                            TextButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen())) ;
                            }, child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),))
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {

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



                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentRegister())) ;
                        }, child: Text("< User Registration "))
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
