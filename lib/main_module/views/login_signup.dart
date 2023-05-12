import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../controllers/login_controller.dart';

class Login_signup extends StatefulWidget {
  const Login_signup({super.key});

  @override
  State<Login_signup> createState() => _Login_signupState();
}

class _Login_signupState extends State<Login_signup> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: LoginController.emailcontroller,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: LoginController.passwordcontroller,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                LoginController.onlogin(LoginController.emailcontroller.text.toString(),LoginController.passwordcontroller.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text('Sign UP')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
