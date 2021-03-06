import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:movie_app/details_movie_cate/page.dart';
import 'package:movie_app/home/component/homeheader.dart';
import 'package:movie_app/model/movie_cate.dart';
import 'package:movie_app/network/client.dart';
import 'package:movie_app/widget/search/searchpage.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../model/item_model_fav.dart';
import '../../../../provider/history_provider.dart';

class Cate_Movie extends StatelessWidget {
  static String routeName = "/cate_movie";
  Cate_Movie(
      {Key key,
      // this.movie_cate,
      this.name,
      this.id})
      : super(key: key);
  // final Movie_Cate movie_cate;
  int id;
  String name;
  @override
  Widget build(BuildContext context) {
    Client client = Client();
    return Scaffold(
      appBar: AppBar(
        leading: SafeArea(child: BackButton(color: Colors.pink)),
        title: Text(
          "${this.name}",
          style: TextStyle(color: Colors.pink),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchMovie());
            },
            icon: Icon(
              Icons.search_sharp,
              color: Colors.pink,
            ),
          ),
        ],
        backgroundColor: backgroundHeader,
      ),
      body: (FutureBuilder<Genres>(
        future: convertFromJsonToModel(client.getMoviebyCategory(id)),
        builder: (BuildContext context, snapshot) {
          var bookMark = Provider.of<HistoryProvider>(context);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                // child: CircularProgressIndicator(),
                );
          }
          if (snapshot.hasData) {
            if (snapshot.data.results.length == 0) {
              return Center(
                child: Text("Empty"),
              );
            } else {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0,
                ),
                itemCount: snapshot.data?.results?.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (ctx, index) {
                  Movie_Cate movie_cate = snapshot.data.results[index];
                  return new Stack(children: [
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        child: GestureDetector(
                            onTap: () {
                              ItemModel itemModel = new ItemModel(
                                  id: movie_cate.id,
                                  title: movie_cate.title,
                                  genre_ids:movie_cate.genre_ids,
                                  vote_count: movie_cate.vote_count,
                                  voteAverage: movie_cate.vote_average,
                                  overview: movie_cate.overview,
                                  year: movie_cate.year,
                                  originalLanguage:movie_cate.original_language ,
                                  release_date: movie_cate.release_date,
                                  backdropPath: movie_cate.backdrop_path ??
                                      movie_cate.poster_path ??
                                      '');
                              if (bookMark.checkItem(itemModel) == true) {
                              } else {
                                bookMark.addItem(itemModel);
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                          movie_cate: movie_cate)));
                            },
                            child: Column(children: [
                              Container(
                                  height: 171,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500${movie_cate.backdrop_path ?? movie_cate.poster_path ?? ''}'),
                                    ),
                                  )),
                            ]))

                        //   ],
                        // ),
                        ),
                    Padding(
                        padding: EdgeInsets.only(left: 10, top: 150),
                        child: Text(
                          movie_cate?.title?.toUpperCase() ?? "",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontFamily: "null"),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                        )),
                  ]);

                  // GestureDetector(
                  //   onTap: () {
                  //     //print(product.id.toString());
                  //     // Navigator.pushNamed(context, DetailsScreen.routeName,arguments: MovieDetailsArguments(movie: movie!));
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) =>
                  //                 Cate_Movie(cate: cate, id: null,)));
                  //   },
                  //   child:
                },
              );
            }
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error ${snapshot.error}"),
            );
          }
          return Center(
            child: Text("Error"),
          );
        },
      )),
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
