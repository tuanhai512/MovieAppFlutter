import 'package:flutter/material.dart';
import 'package:movie_app/signin/component/signin_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            headerScreen(context),
            SigninForm(),
            footerScreen(context),
          ],
        ),
      ),
    ));
  }

  Widget headerScreen(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      alignment: Alignment.bottomRight,
    );
  }

  Widget footerScreen(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomLeft,
    );
  }
}
