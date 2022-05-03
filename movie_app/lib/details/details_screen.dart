


import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/details/components/body.dart';



class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  DetailsScreen({Key? key,required this.movie}) : super(key: key);
  final Movie movie;


  @override

  Widget build(BuildContext context) {
   // final MovieDetailsArguments arguments =  ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Details"),
      ),
      body: Body(movie: movie),
    );
  }
}
class MovieDetailsArguments {
  final Movie movie;

  MovieDetailsArguments({required this.movie});
}