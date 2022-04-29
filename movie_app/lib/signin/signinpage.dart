import 'package:flutter/material.dart';
import 'package:movie_app/signin/component/body.dart';

class Signin extends StatelessWidget {
  static String routeName = '/sign_in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
