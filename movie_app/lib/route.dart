
import 'dart:js';

import 'package:flutter/widgets.dart';
import 'package:movie_app/screen/landingPage.dart';
import 'package:movie_app/signup/signuppage.dart';
import 'package:movie_app/home/homepage.dart';
import 'package:movie_app/splash/splashpage.dart';
import 'package:movie_app/signin/signinpage.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName : (context) => SplashPage(),
  HomePage.routeName : (context) => HomePage(),
  landingPage.routeName : (context) => landingPage(),
  // DetailsScreen.routeName : (context) => DetailsScreen(),

};
