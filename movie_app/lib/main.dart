import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/details/details_screen.dart';
import 'package:movie_app/home/component/fragment/home_frag/category_movie.dart';
import 'package:movie_app/screen/landingPage.dart';
import 'package:movie_app/home/homepage.dart';
import 'package:movie_app/signin/signinpage.dart';
import 'package:movie_app/signup/signuppage.dart';
import 'package:movie_app/widget/provider/theme_provider.dart';

import 'package:provider/provider.dart';
import 'package:movie_app/splash/splashpage.dart';
import 'package:movie_app/provider/theme_provider.dart';
import 'package:movie_app/provider/favorite_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ChangeNotifierProvider(create: (context) => FavoriteProvider()),
  ], child: MyApp()));
}

class Favorite extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ChangeNotifierProvider(builder: (context, _) {
      final favoriteProvider = Provider.of<Favorite>(context);
      return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          home: HomePage(),
          routes: {
            SplashPage.routeName: (context) => SplashPage(),
            landingPage.routeName: (context) => landingPage(),
            HomePage.routeName: (context) => HomePage(),
            // DetailsScreen.routeName : (context) => DetailsScreen(),
          });
    });
  }
}

class Theme extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ChangeNotifierProvider(builder: (context, _) {
      final themeProvider = Provider.of<ThemeProvider>(context);
      return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          home: HomePage(),
          routes: {
            SplashPage.routeName: (context) => SplashPage(),
            landingPage.routeName: (context) => landingPage(),
            HomePage.routeName: (context) => HomePage(),
            // DetailsScreen.routeName : (context) => DetailsScreen(),
          });
    });
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        home: HomePage(),
        routes: {
          SplashPage.routeName: (context) => SplashPage(),
          landingPage.routeName: (context) => landingPage(),
          HomePage.routeName: (context) => HomePage(),
          // DetailsScreen.routeName : (context) => DetailsScreen(),
        });
  }
}
