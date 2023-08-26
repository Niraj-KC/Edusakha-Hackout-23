import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'User.dart';

AuthTokenVerification(User user) async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? auth_token = prefs.getString("auth_token");
  user.isStudent = prefs.getBool("isStudent");

  if(user.isStudent!){

    print(auth_token);

    if (auth_token == null) return false;

    print("ok1");

    Map<String, String>? header = {"Authorization": auth_token};

    final res = await http.post(
        Uri.parse('http://192.168.1.5:5689/is-logged-in/'),
        headers: header);
    // .timeout(Duration(seconds: 5))
    // .onError((error, stackTrace) {print("time out"); return false;});

    print("ok2 $res");

    if (res.statusCode == 200) {
      Map<String, dynamic> resJson = jsonDecode(res.body);

      user.isAuthorized = resJson["responseData"]["isLoggedIn"];
      if (user.isAuthorized == true) {
        user.userID = resJson["responseData"]["userID"];
        user.email = resJson["responseData"]["userEmail"];
        print("AuthComplete");
        return true;
      }
      return false;
    } else {
      print("Failed to verify token");
      return false;
    }

  }

}
