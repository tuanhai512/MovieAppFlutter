import 'package:flutter/material.dart';
import 'package:movie_app/model/item_model_fav.dart';
import 'package:movie_app/detail_item_model/components/body.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  DetailsScreen({Key key,  this.movie}) : super(key: key);
  final ItemModel movie;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Body(movie: movie),
    );
  }
}
