import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:movie_app/model/category.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/network/client.dart';

import '../../../widget/sidebar/button.dart';

class FavoriteFrag extends StatelessWidget {
  // List<Movie> products;
  Client client = Client();
  // FavoriteFrag(this.products);

  @override
  Widget build(BuildContext context) {
    // print(products.length.toString());
    return Expanded(
        child: Column(
           children:[
           ],
          ),

    );
  }
}

Future<Genres> convertFromJsonToModel(Future<http.Response> response) async {
  final responseResult = await response;
  if (responseResult.statusCode == 200) {
    final jsMap = jsonDecode(responseResult.body);
    return Genres.fromJson(jsMap);
  }
  return null;
}