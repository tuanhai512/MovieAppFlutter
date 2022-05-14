import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  DetailsScreen({Key key,  this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    // final MovieDetailsArguments arguments =  ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      body: Body(movie: movie),
    );
  }
}

class MovieDetailsArguments {
  final Movie movie;

  MovieDetailsArguments({this.movie});
}
