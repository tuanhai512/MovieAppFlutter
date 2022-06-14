//
import 'package:flutter/material.dart';
import 'package:movie_app/detail_item_model/details_screen.dart';
import 'package:movie_app/model/item_model_fav.dart';
import 'package:movie_app/network/client.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:movie_app/provider/history_provider.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';

class historyPage extends StatefulWidget {
  static String routeName = '/list_movie';
  @override
  State<historyPage> createState() => _historyPageState();
}

class _historyPageState extends State<historyPage> {


  @override
  Client client = Client();
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
                  ItemModel model = history.items[index];
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
                                'https://image.tmdb.org/t/p/w500${history.items[index].backdropPath ?? history.items[index].posterPath ?? ''}',
                                fit: BoxFit.fill,
                              ),
                            ) ,
                          ),

                          SizedBox(
                            width: 200,
                            child: Padding(
                              child: Text(history.items[index].title),

                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            ),
                          ),
                          Expanded(
                              child: Container(
                                child: GestureDetector(
                                    onTap: () {
                                      ItemModel model = history.items[index];

                                      history.removeItem(model);

                                      {
                                        print(model);
                                      }
                                    },
                                child: Icon(
                                  Icons.delete_sweep_outlined,
                                  color: primarycolor,
                                )),
                          )),
                        ]),
                  );
                }));
  }
}
