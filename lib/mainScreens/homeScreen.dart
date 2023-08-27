import 'package:flutter/material.dart';

import '../Upcoming.dart';
import '../join_meeting.dart';
import 'package:apnashakha/UserAuth/User.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String>  Uninames = [
       'DA-IICT',
       'Nirma University' ,
       'Dharamsinh Desai University',
        'Pandit Dindayal Petrolium University',
        'Darshan University'
  ] ;
  List<String> filterednames = [];

  void initState() {
    super.initState();
    filterednames.addAll(Uninames);
  }

  void searchContainers(String query) {
    setState(() {
      filterednames = Uninames
          .where((name) => name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("EDUSHAKHA"),

      ),
<<<<<<< HEAD
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10,right: MediaQuery.of(context).size.width*0.35),
                  child: Text("Upcoming Events",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ),
                Column(
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
              ],
            ),
            Column(
              children: [
                Column(
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
                                  child: Text("Hackthon'6",style: TextStyle(fontSize: 25,color: Colors.white),),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.013,right: MediaQuery.of(context).size.width*0.2),
                                  child: Text("25th Aug 18:30",style: TextStyle(fontSize: 18,color: Colors.grey),),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.013,right: MediaQuery.of(context).size.width*0.13),
                                  child: Text("University : " + "PDPU",style: TextStyle(fontSize: 18,color: Colors.grey),),
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
              ],
            ),
            Column(
              children: [
                Column(
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
                                  child: Text("HackNutho",style: TextStyle(fontSize: 25,color: Colors.white),),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.013,right: MediaQuery.of(context).size.width*0.2),
                                  child: Text("26th Aug 12:30",style: TextStyle(fontSize: 18,color: Colors.grey),),
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
              ],
            ),
            Column(
              children: [
                Column(
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
              ],
            ),
            Column(
              children: [
                Column(
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
              ],
            ),
            Column(
              children: [
                Column(
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
                                  child: Text("Hackout'24",style: TextStyle(fontSize: 25,color: Colors.white),),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.013,right: MediaQuery.of(context).size.width*0.2),
                                  child: Text("27th April 18:30",style: TextStyle(fontSize: 18,color: Colors.grey),),
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
              ],
            ),

          ],
        ),
      ) ,
=======
>>>>>>> 1c80cd3dc39ab3485ce62ce255159aaade62b0cd
      drawer: Drawer(
        backgroundColor: AppColors.theme['bg'],
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
