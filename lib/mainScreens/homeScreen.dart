import 'package:apnashakha/UserAuth/curUser.dart';
import 'package:apnashakha/appStartingScreens/login.dart';
import 'package:flutter/material.dart';

import '../Upcoming.dart';
import '../UserAuth/User.dart';
import '../reusable_Widgets/colors.dart';
import '../user_profile.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<String> searchList;

  CustomSearchDelegate(this.searchList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredResults = searchList
        .where((name) => name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredResults[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchResultScreen(result: filteredResults[index]),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestedResults = searchList
        .where((name) => name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestedResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          splashColor: Colors.red,
          title: Text(suggestedResults[index]),
          onTap: () {
            query = suggestedResults[index];
            showResults(context);
          },
        );
      },
    );
  }
}


class SearchResultScreen extends StatelessWidget {
  final String result;

  const SearchResultScreen({required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.theme['bg'],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(result),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/en/8/83/Nirma_University_Logo.png"),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Text(
              "About $result",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email: technu@nirmauni.ac.in", style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Text("Address: Opposite SGVP, SG Highway, Ahmedabad", style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Text("Website: nirmauni.in", style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width*0.05),
            Padding(
              padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.3),
              child: Text("Upcoming Events ",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: MediaQuery.of(context).size.width*0.05,) ,
            SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 10,) ,
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.theme['bg']
                      ),
                      height: 120,
                      width: MediaQuery.of(context).size.width*0.9,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20,top: MediaQuery.of(context).size.height*0.025,right: MediaQuery.of(context).size.width*0.25),
                                child: Text("Hackout'23",style: TextStyle(fontSize: 25,color: Colors.white),),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.013,right: MediaQuery.of(context).size.width*0.15),
                                child: Text("25th Aug 18:30",style: TextStyle(fontSize: 18,color: Colors.grey),),
                              ),
                            ],
                          ),
                          ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),),onPressed: (){}, child: Text("Register")),
                        ],
                      ),
                    )
                  ],
                ),
                width: 400,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}




class HomeScreen extends StatefulWidget {
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
  @override
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.05),
            child: IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(
                    Uninames,
                  ),
                );
              }, icon: Icon(Icons.search) ,
            ),
          )
        ],
        backgroundColor: Colors.green,
        title: Text("Edushakha"),
      ),

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
      drawer: Drawer(
        backgroundColor: AppColors.theme['bg'],
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: DrawerHeader(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            child: Icon(Icons.person),
                            backgroundColor: Colors.grey,
                            radius: 40,
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                          Text("${CurUser.name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.15),
                        child: TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfileScreen())) ;

                            },
                            child: Text("Click Here  to View")),
                      )
                    ],
                  ),
                ),
              ),
              Divider(color: Colors.black,),
              InkWell(
                  onTap : (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Upcoming())) ;

                  } , child: ListTile(title: Text("Upcoming Meeting",style: TextStyle(fontWeight: FontWeight.bold),),)),
              Divider(color: Colors.black,),
              SizedBox(height: MediaQuery.of(context).size.height*0.6,) ,
              ListTile(
                title: InkWell(
                    onTap:  () {
                      User().removeUser();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
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