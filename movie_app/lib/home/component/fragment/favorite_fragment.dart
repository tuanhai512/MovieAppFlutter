import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:movie_app/model/category.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/network/client.dart';
import 'package:movie_app/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

import '../../../widget/sidebar/button.dart';

class FavoriteFrag extends StatelessWidget {
  // List<Movie> products;
  Client client = Client();
  // FavoriteFrag(this.products);

  @override
  Widget build(BuildContext context) {
    var bookMark = Provider.of<FavoriteProvider>(context);
    // print(products.length.toString());
    return Expanded(
        child: 
        // ButtonWidget(
        //   icon: Icons.open_in_new,
        //   text: 'Open Drawer',
        //   onClicked: () {
        //     Scaffold.of(context).openDrawer();
        //   },
        // ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: bookMark.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  height: 10,
                  width: 10,
                  child:  Image.network(
                          'https://image.tmdb.org/t/p/w500${bookMark.items[index].backdropPath ?? bookMark.items[index].posterPath ?? ''}')
                      ,
                ),
                title:  Text(bookMark.items[index].title)
                   ,
                trailing:
                     Icon(Icons.star_border)
                     ,
              );
            })
      
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
