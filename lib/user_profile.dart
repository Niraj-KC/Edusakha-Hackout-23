import 'package:apnashakha/mainScreens/homeScreen.dart';
import 'package:apnashakha/reusable_Widgets/colors.dart';
import 'package:flutter/material.dart' ;

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          leading: BackButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen())) ;
            },
          ),
          title: Text("Your Profie"),
          backgroundColor: Colors.green,
        ),

        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.12,),
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius:60,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.06,),
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.1,
                  width: MediaQuery.of(context).size.width*0.9,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                )
              ],
            )


          ],
        ),
      ),
    );
  }
}
