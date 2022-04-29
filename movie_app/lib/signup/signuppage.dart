import 'package:flutter/material.dart';
import 'package:movie_app/signup/component/body.dart';

class SignupPage extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.lightBlueAccent,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.lightBlueAccent),
        ),
      ),
      body: Body(),
    );
  }
}
