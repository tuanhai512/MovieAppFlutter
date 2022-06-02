//
import 'package:flutter/material.dart';
import 'package:movie_app/details/details_screen.dart';
import 'package:movie_app/model/item_model_fav.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/network/client.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:movie_app/provider/history_provider.dart';
import 'package:provider/provider.dart';
import 'package:quiver/iterables.dart';
import 'dart:convert';

import '../../../../constants.dart';
import '../../../../provider/favorite_provider.dart';

class historyPage extends StatefulWidget {
  static String routeName = '/list_movie';
  @override
  State<historyPage> createState() => _historyPageState();
}

class _historyPageState extends State<historyPage> {
  Client client = Client();

  @override
  Widget build(BuildContext context) {
    var history = Provider.of<HistoryProvider>(context);

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
                itemCount: history.items.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: GestureDetector(
                        onTap: () {
                          history.items[index];
                          print(history.items[index].id);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             DetailsScreen(movie: movie)));
                        },
                        child: Row(children: [
                          Container(
                            height: 80,
                            width: 80,
                            child: Image.network(
                                'https://image.tmdb.org/t/p/w500${history.items[index].backdropPath ?? history.items[index].posterPath ?? ''}'),
                          ),
                          Text(history.items[index].title),
                          Container(
                            child: GestureDetector(
                                onTap: () {
                                  ItemModel model = history.items[index];

                                  history.removeItem(model);

                                  {
                                    print(model);
                                  }
                                },
                                child: Icon(
                                  Icons.favorite,
                                  color: primarycolor,
                                )),
                          )
                        ])),
                  );
                }));
  }
}
