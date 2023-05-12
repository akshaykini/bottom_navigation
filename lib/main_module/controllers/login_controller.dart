import 'package:bottom_navigation/Utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginController {
  static TextEditingController emailcontroller = TextEditingController();
  static TextEditingController passwordcontroller = TextEditingController();

  static void onlogin(String emailcontroller, passwordcontroller) async {
    try {
      final response = await http.post(Uri.parse(Stringdata.loginapi),
      
          body: {
            'email': emailcontroller,
            'password': passwordcontroller 
            });

            if(response.statusCode == 200){
              print(response.body.toString());
            }
            
    } catch (e) {
      print(e.toString());
    }
  }
}
