import 'package:flutter/material.dart';
import 'package:movie_app/model/category.dart';
import 'package:movie_app/model/movie_cate.dart';
import '../../model/movie.dart';

class Genres extends StatelessWidget {
  const Genres({  Key? key, required this.movie
    // ,required this.category
  }) : super(key: key);
// final Movie_Cate category;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    // category.genre_ids=movie.genre_ids;
    return Text(
      // '${category.name}',
      '${movie.genre_ids}',
      style: TextStyle(color: Color(0xFF9A9BB2)),
    );
  }
}
