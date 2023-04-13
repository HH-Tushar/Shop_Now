import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class CustomHttp {
 static String baseUrl = "http://temp.techsolutions-bd.com/";
 static login(String email, String password) async {

    try {
      var Login = await http.post(Uri.parse("${baseUrl}api/admin/sign-in"),
          body: {
        'email': email.toString(),
            'password': password.toString(),
          },
      );
      if (Login.statusCode == 200) {
        var response = jsonDecode(Login.body);
        print(response);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response['access_token']);
        print("token is: ${prefs.getString('token')}");
        return true;
      }
      return false;
    } catch (e) {
      print(e);
    }
  }

//name, email, password, password_confirmation,

  static sineUp(String name, String email, String password, String password_confirmation) async {
    try {
      var Login = await http.post(
          Uri.parse("${baseUrl}api/admin/create/new/admin"),
          body: {
            'name': name.toString(),
            'email': email.toString(),
            'password': password.toString(),
            'password_confirmation': password_confirmation.toString()});

      if (Login.statusCode == 200) {
        var response = jsonDecode(Login.body);
        print(response);
        return true;
      }
      return false;
    } catch (e) {
      print(e);
    }
  }

}
