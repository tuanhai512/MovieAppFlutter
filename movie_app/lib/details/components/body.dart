import 'package:flutter/material.dart';
import 'package:movie_app/details/components/cast_and_crew.dart';
import 'package:movie_app/model/movie.dart';

import 'backdrop_rating.dart';
// import 'cast_and_crew.dart';
import 'title_duration_and_fav_btn.dart';

class Body extends StatelessWidget {
  final Movie movie;

  const Body({Key? key,required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // it will provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BackdropAndRating(size: size, movie: movie),
          SizedBox(height: 20 / 2),
          TitleDurationAndFabBtn(movie: movie),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20 / 2,
              horizontal: 20,
            ),
            child: Text(
              "Plot Summary",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),

         // CastAndCrew(casts: movie.cast),
        ],
      ),
    );
  }
}
