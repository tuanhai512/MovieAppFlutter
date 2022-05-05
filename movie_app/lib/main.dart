import 'package:flutter/material.dart';
import 'package:movie_app/details/details_screen.dart';
import 'package:movie_app/screen/landingPage.dart';
import 'package:movie_app/home/homepage.dart';
import 'package:movie_app/signin/signinpage.dart';
import 'package:movie_app/signup/signuppage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Signin(),
        routes: {
          Signin.routeName: (context) => Signin(),
          landingPage.routeName: (context) => landingPage(),
          HomePage.routeName: (context) => HomePage(),
          SignupPage.routeName: (context) => SignupPage(),
          // DetailsScreen.routeName : (context) => DetailsScreen(),
        }
        // home:HomePage(),
        );
  }
}
