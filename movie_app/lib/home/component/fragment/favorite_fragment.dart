import 'package:flutter/material.dart';
import 'package:movie_app/home/component/fragment/fav_frag/favorite_list.dart';
import 'package:movie_app/model/movie.dart';

class FavoriteFrag extends StatelessWidget {
  // List<Movie> products;

  // FavoriteFrag(this.products);

  @override
  Widget build(BuildContext context) {
    // print(products.length.toString());
    return Scaffold(
        appBar: AppBar(
          title: Text("Movie"),
        ),
        body: favoritePage());
  }
}
