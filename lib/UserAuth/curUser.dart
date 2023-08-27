import '../main.dart';

class CurUser {
  static String? userID;
  static String? email;
  static String? name;
  static String? dob;
  static String? pwd;
  static bool? isStudent = true;
  static String? address;
  static String? webAdd;

  static String? auth_token;
  static bool isAuthorized = false;
  static String basicUri = BASE_URL;

  static curUserFromJson(Map<String, dynamic> json){
    CurUser.isStudent = json["is_student"];
    CurUser.name = json["name"];
    CurUser.email = json["email"];
    CurUser.auth_token = json["token"];
  }

}

