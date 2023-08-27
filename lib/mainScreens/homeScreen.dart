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
