import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:movie_app/home/component/fragment/fav_frag/favorite_list.dart';
import 'package:movie_app/home/component/fragment/home_frag/category_movie.dart';
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
           children:[ ButtonWidget(
              icon: Icons.open_in_new,
              text: 'Open Drawer',
              onClicked: () {
                Scaffold.of(context).openDrawer();
                // Scaffold.of(context).openEndDrawer();
              },
            ),  ],
          ),

    );
  }
}

Future<Genres?> convertFromJsonToModel(Future<http.Response> response) async {
  final responseResult = await response;
  if (responseResult.statusCode == 200) {
    final jsMap = jsonDecode(responseResult.body);
    return Genres.fromJson(jsMap);
  }
  return null;
}