//
import 'package:flutter/material.dart';
import 'package:movie_app/model/item_model_his.dart';
import 'package:movie_app/network/client.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

import '../../../../constants.dart';
import '../../../../detail_item_model_fav/details_screen.dart';
import '../../../../provider/favorite_provider.dart';

class favoritePage extends StatefulWidget {
  static String routeName = '/list_movie';
  @override
  State<favoritePage> createState() => _favoritePageState();
}

class _favoritePageState extends State<favoritePage> {
  Client client = Client();

  @override
  Widget build(BuildContext context) {
    var bookMark = Provider.of<FavoriteProvider>(context);
    // print(products.length.toString());
    return Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: bookMark.items.length,
            itemBuilder: (context, index) {
              ItemModelFav model = bookMark.items[index];

              return Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Row(children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailsScreen(movie: model)));
                      },
                      child: Container(
                        height: 60,
                        width: 80,
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${bookMark.items[index].backdropPath ?? bookMark.items[index].posterPath ?? ''}',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Padding(
                        child: Text(bookMark.items[index].title),
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: GestureDetector(
                          onTap: () {
                            ItemModelFav model = bookMark.items[index];
                            bookMark.removeItem(model);

                            {
                              print(model);
                            }
                          },
                          child: Icon(
                            Icons.favorite,
                            color: primarycolor,
                          )),
                    )),
                  ]));
            }));
  }
}
