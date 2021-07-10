import 'package:smartschool_mobile/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth extends ChangeNotifier {
  String? _name;
  String? _email;
  String? _token;
  bool? _isTeacher;
//getters
  String? get getName => _name;
  String? get getEmail => _name;
  String? get getToken => _token;
  bool? get getIsTeacher => _isTeacher;
//setters
  set isTeacher(bool b) {
    this._isTeacher = b;
  }

  Future<String> onStartUp() async {
    String retVal = "error";
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      if (sharedPreferences.getString('user') != null) {
        _name = sharedPreferences.getString('user');
        _token = sharedPreferences.getString('token');
        // _isTeacher =
        //     sharedPreferences.getString('role') == 'teacher' ? true : false;
        retVal = "success";
      }
    } catch (e) {
      print(e);
    }

    return (retVal);
  }

//   Future<String> signOut() async {
//     String retVal = "error";
//     try {
//       SharedPreferences sharedPreferences =
//           await SharedPreferences.getInstance();
//       await sharedPreferences.clear();

//       _name = null;
//       _token = null;
//       retVal = "success";
//     } catch (e) {
//       print(e);
//     }

//     return (retVal);
//   }

  Future<String> signIn(String email, String pass) async {
    String retValue = "error";

    try {
      var client = http.Client();

      var uri = Uri.parse(signinUrl);

      Map body = {"Email": email, "Password": pass};
      var jsonResponse;
      var res = await client.post(uri, body: body);
      // print(res.body);
      jsonResponse = json.decode(res.body);

      //Check API status

      if (res.statusCode == 200) {
        jsonResponse = json.decode(res.body);

        print("Response status: ${res.statusCode}");

        print("Response status: ${res.body}");

        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        // if (jsonResponse != null) {

        _token = jsonResponse['token'];
        _name = jsonResponse['user']['Name'];
        _email = jsonResponse['user']['Email'];
        // bool _isTeacherFromJson =
        //     jsonResponse['user']['role'] == 'teacher' ? true : false;
        // if (_isTeacherFromJson != _isTeacher) {
        //   return _isTeacherFromJson
        //       ? 'Login with Student Account or go to Teacher Login!'
        //       : 'Login with Teacher Account or go to Student Login!';
        // }
        sharedPreferences.setString("token", _token!);
        sharedPreferences.setString("user", _name!);
        sharedPreferences.setString('role', jsonResponse['user']['role']);

        print('----------Printing From Shared Preferences----------');
        print('User:\n');
        print(sharedPreferences.getString('user'));
        return "success";
      }

      retValue = jsonResponse['Error'].toString();
    } catch (e) {
      // return e.toString();
      retValue = "error";
    }

    return retValue;
  }

// //   Future<String> signUp(String name, String email, String password, String dob,
// //       String classroom) async {
// //     String retValue = 'Error Signing up!';
// //     try {
// //       var client = http.Client();
// //       var uri = Uri.parse(signupUrl);
// //       Map body = {
// //         "Name": name,
// //         "Email": email,
// //         "Password": password,
// //         "DOB": dob,
// //         "classroom": classroom,
// //         "role": "student"
// //       };
// //       var res = await client
// //           .post(uri, body: body, headers: {'Authorization': 'Bearer $_token'});
// //       var jsonResponse = json.decode(res.body);
// //       print(res.body);
// //       if (res.statusCode == 200) {
// //         // to check if succesful message has come from api
// //         String result = jsonResponse['message'];
// //         print('result');
// //         return 'success';
// //       }
// //       retValue = jsonDecode(res.body)['Error'];
// //     } catch (e) {
// //       print(e);
// //       retValue = e.toString();
// //     }
// //     return retValue;
// //   }
}
