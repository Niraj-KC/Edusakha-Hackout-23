import 'package:apnashakha/mainScreens/homeScreen.dart';
import 'package:apnashakha/reusable_Widgets/colors.dart';
import 'package:flutter/material.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey ,
        appBar: AppBar(
          leading: BackButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen())) ;
            },
          ),
          backgroundColor: Colors.green,
          title: Text("Upcoming Meeting"),
        ),
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.02,) ,
            Padding(
              padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.01),
              child: Container(
                height: MediaQuery.of(context).size.height*0.15,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   color: AppColors.theme['bg'],
                 ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20,top: MediaQuery.of(context).size.height*0.025,right: MediaQuery.of(context).size.width*0.25),
                          child: Text("Hackout'23",style: TextStyle(fontSize: 25,color: Colors.white),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.013,right: MediaQuery.of(context).size.width*0.2),
                          child: Text("25th Aug 18:30",style: TextStyle(fontSize: 18,color: Colors.grey),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.013,right: MediaQuery.of(context).size.width*0.13),
                          child: Text("University : " + "DA-IICT",style: TextStyle(fontSize: 18,color: Colors.grey),),
                        ),
                      ],
                    ),
                    ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),),onPressed: (){}, child: Text("Register")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
