//
import 'package:flutter/material.dart';
import 'package:movie_app/details/details_screen.dart';
import 'package:movie_app/model/item_model_fav.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/network/client.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

import '../../../../constants.dart';
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

  Future<Result> convertFromJsonToModel(Future<http.Response> response) async {
    final responseResult = await response;
    if (responseResult.statusCode == 200) {
      final jsMap = jsonDecode(responseResult.body);
      return Result.fromJson(jsMap);
    }
    return null;
  }
}
