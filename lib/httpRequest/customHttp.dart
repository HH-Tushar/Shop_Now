import 'dart:convert';

import 'package:http/http.dart' as http;

login(String email, String Password) async {
  String baseUrl = "http://temp.techsolutions-bd.com/";

  try {
    var Login = await http.post(Uri.parse(baseUrl + "api/admin/sign-in"),
        body: {'email': email.toString(), 'password': Password.toString()});
    var response = jsonDecode(Login.body);
    print(response);
    if (Login.statusCode == 200) {
      return true;
    }
    return false;
  } catch (e) {
    print(e);
  }
}

//name, email, password, password_confirmation,

sineUp(String name,String email, String password,String password_confirmation) async {
  String baseUrl = "http://temp.techsolutions-bd.com/";

  try {
    var Login = await http.post(Uri.parse(baseUrl + "api/admin/create/new/admin"),
        body: {
      'name':name.toString(),
         'email':email.toString(),
      'password': password.toString(),
          'password_confirmation': password_confirmation.toString()});
    var response = jsonDecode(Login.body);
    print(response);
    if (Login.statusCode == 200) {
      return true;
    }
    return false;
  } catch (e) {
    print(e);
  }
}
