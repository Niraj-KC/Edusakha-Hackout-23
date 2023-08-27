import 'package:apnashakha/appStartingScreens/login.dart';
import 'package:flutter/material.dart';

import '../Upcoming.dart';
import '../join_meeting.dart';
import 'package:apnashakha/UserAuth/User.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EDUSHAKHA"),

      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: DrawerHeader(
                  child: CircleAvatar(
                    radius: 60,
                  ),
                ),
              ),
              Divider() ,
              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>JoinMeeting())) ;

              },child: ListTile(title: Text("Join Meeting"),)),
              Divider(),
              InkWell(
                  onTap : (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Upcoming())) ;

              } , child: ListTile(title: Text("Upcoming Meeting"),)),
              Divider(),
              SizedBox(height: MediaQuery.of(context).size.height*0.5,) ,
              ListTile(
                title: InkWell(
                    onTap:  () {
                      User().removeUser();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },

                    child: Text("Log Out")),
                leading: Icon(Icons.logout),
              )

            ],
          ),
        ),

      ),
    );
  }
}
