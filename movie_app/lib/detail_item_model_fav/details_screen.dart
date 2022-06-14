import 'package:flutter/material.dart';
import 'package:movie_app/detail_item_model_fav/components/body.dart';
import 'package:movie_app/model/item_model_his.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  DetailsScreen({Key key,  this.movie}) : super(key: key);
  final ItemModelFav movie;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Body(movie: movie),
    );
  }
}
