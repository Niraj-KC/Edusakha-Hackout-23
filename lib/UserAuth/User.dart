import 'dart:convert';

import 'package:apnashakha/main.dart';
import 'package:http/http.dart' as http ;
import 'package:shared_preferences/shared_preferences.dart';


class User {
  // String? username;
  String? userID;
  String? email;
  String? name;
  String? dob;
  String? pwd;
  bool? isStudent = true;

  String? auth_token;
  bool isAuthorized = false;
  String basicUri = BASE_URL;

  User({this.email, this.name, this.pwd, this.dob, this.isStudent});

  Map<String, String> toJSONLogIn(User user) {
    return {
      // "username": user.username!,
      "email": user.email!,
      "password": user.pwd!,
    };
    }

  Map<String, String> toJSON(User user) {
    if (isStudent!){
      return {
        // "username": user.username!,
        "email": user.email!,
        "password": user.pwd!,
        "name": user.name!,
        "dob": user.dob!,
      };
    }
    else {
      return {
        "":""
      };
    }
  }


  Future signUp(User user) async {
    if(isStudent!){
      final res = await http.post(
        Uri.parse('$basicUri/signup/student/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user.toJSON(user)),
      );
      if (res.statusCode == 200)
        return jsonDecode(res.body);
      else
        throw Exception("Failed to register");
    }


  }

  Future signIn(User user) async {

      final res = await http.post(
        Uri.parse('$basicUri/login/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user.toJSONLogIn(user)),
      );

      if (res.statusCode == 200)
        return jsonDecode(res.body);
      else
        throw Exception("Failed to login");

  }




  Future storeUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("auth_token", auth_token!);
    prefs.setBool("isStudent", isStudent!);
  }



}