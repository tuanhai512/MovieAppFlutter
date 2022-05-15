import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/details/details_screen.dart';
import 'package:movie_app/home/component/fragment/home_frag/category_movie.dart';
import 'package:movie_app/screen/landingPage.dart';
import 'package:movie_app/home/homepage.dart';
import 'package:movie_app/signin/signinpage.dart';
import 'package:movie_app/signup/signuppage.dart';

import 'package:provider/provider.dart';
import 'package:movie_app/splash/splashpage.dart';
import 'package:movie_app/widget/provider/theme_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.

            home: HomePage(),
            routes: {
              SplashPage.routeName: (context) => SplashPage(),
              landingPage.routeName: (context) => landingPage(),
              HomePage.routeName: (context) => HomePage(),
              // DetailsScreen.routeName : (context) => DetailsScreen(),
            }
            );
      });
}
