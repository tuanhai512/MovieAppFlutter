import 'package:flutter/material.dart';
import 'package:movie_app/details_movie_cate/components/body.dart';
import 'package:movie_app/model/movie_cate.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  DetailsScreen({Key key,  this.movie_cate}) : super(key: key);
  final Movie_Cate movie_cate;
  @override
  Widget build(BuildContext context) {
    // final MovieDetailsArguments arguments =  ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      body: Body(movie_cate: movie_cate),
    );
  }
}
//
// class MovieDetailsArguments {
//   final Movie movie;
//
//   MovieDetailsArguments({required this.movie});
// }
