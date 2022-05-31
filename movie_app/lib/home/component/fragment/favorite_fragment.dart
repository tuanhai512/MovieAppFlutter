import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/model/category.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/network/client.dart';
import 'package:movie_app/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

import '../../../model/item_model_fav.dart';
import '../../../widget/sidebar/button.dart';

class FavoriteFrag extends StatefulWidget {
  @override
  State<FavoriteFrag> createState() => _FavoriteFrag();
}

class _FavoriteFrag extends State<FavoriteFrag> {
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
                  return Row(children: [
                    Container(
                      height: 80,
                      width: 80,
                      child: Image.network(
                          'https://image.tmdb.org/t/p/w500${bookMark.items[index].backdropPath ?? bookMark.items[index].posterPath ?? ''}'),
                    ),
                    Text(bookMark.items[index].title),
                    Container(
                      child: GestureDetector(
                          onTap: () {
                            ItemModel model = bookMark.items[index];

                            bookMark.removeItem(model);

                            {
                              print(model);
                            }
                          },
                          child: Icon(
                            Icons.favorite,
                            color: primarycolor,
                          )),
                    )
                  ]);
                }));
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
