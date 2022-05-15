import 'package:flutter/material.dart';
import 'package:movie_app/home/component/fragment/home_frag/movie_latest.dart';
import 'package:movie_app/home/component/fragment/home_frag/movie_upcoming.dart';
import 'package:movie_app/home/component/fragment/home_frag/product_popular.dart';

class HomeFrag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
          children: [
            MovieLatest(),
            MoviePopular(),
            MovieUpcoming()
          ]
      ),
    );
  }
}
