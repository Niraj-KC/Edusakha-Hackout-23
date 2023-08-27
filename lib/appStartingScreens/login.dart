import 'package:apnashakha/appStartingScreens/register.dart';
import 'package:apnashakha/reusable_Widgets/colors.dart';
import 'package:flutter/material.dart' ;
import 'package:apnashakha/reusable_Widgets/colors.dart' ;
import 'package:apnashakha/UserAuth/curUser.dart';
import '../UserAuth/User.dart';
import '../mainScreens/homeScreen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _showPassword = false;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  void signIn() async {
    showDialog(context: context, builder: (context)
    {
      return Center(child: CircularProgressIndicator());
    } ,

    );

    User user = User(email: email.text, pwd: pass.text);
    print("object");
    Map<String, dynamic> res = await user.signIn(user);
    print("object2 ${res}");


    user.isAuthorized = res["responseData"]["isAuthenticated"];
    if(user.isAuthorized==true){
      CurUser.curUserFromJson(res["responseData"]);

      user.storeUser(user);
      print("stored user: ${CurUser.auth_token}");

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: AppColors.theme["bg"],
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40) ,
              ),
              child: Center(
                child: SizedBox(
                  width: 300,
                  height: 500,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: AssetImage("assets/images/login_phot.png"),),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,) ,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.01 ),
                          child: TextFormField(
                            controller: email,
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
                            controller: pass,
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
                            SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                            Text("Don't have Account ? ",style: TextStyle(color: Colors.white),) ,
                            TextButton
                              (
                                onPressed: ()
                                {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentRegister())) ;
                            },
                                child:Text("Register",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            signIn();
                          },
                          child: Text('Login',style: TextStyle(color: Colors.black),),
                          style: ElevatedButton.styleFrom(
                            primary:  AppColors.theme['loginc'],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16,horizontal: 15),
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
      ),
    );
  }
}
