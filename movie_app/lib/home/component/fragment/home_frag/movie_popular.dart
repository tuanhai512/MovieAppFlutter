import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:movie_app/details/details_screen.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/network/client.dart';
import 'package:movie_app/constants.dart';
import 'package:provider/provider.dart';

import '../../../../model/item_model_fav.dart';
import '../../../../provider/history_provider.dart';

class MoviePopular extends StatelessWidget {
  static String routeName = '/movie_popular';

  @override
  Widget build(BuildContext context) {
    // var productsAPI = Utilities().getProducts();
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                      ' PHIM PHỔ BIẾN',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: primarycolor),
                    )),
                // Text(
                //   'See more',
                //   style: TextStyle(fontSize: 16, color: Colors.lightBlue),
                // ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 280,
              child: MovieItem(),
            )
          ],
        ),
      ),
    );
  }
}

class MovieItem extends StatelessWidget {
  Client client = Client();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Result>(
      future: convertFromJsonToModel(client.getPopular()),
      builder: (BuildContext context, snapshot) {
        var bookMark = Provider.of<HistoryProvider>(context);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            // child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          if (snapshot.data?.results?.length == 0) {
            return Center(
              child: Text("Empty"),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data?.results?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  Movie movie = snapshot.data?.results[index];

                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: GestureDetector(
                        onTap: ()  async {
                          ItemModel itemModel = new ItemModel(
                              id: movie.id,
                              title: movie.title,
                              genre_ids:movie.genre_ids,
                              vote_count: movie.vote_count,
                              voteAverage: movie.voteAverage,
                              overview: movie.overview,
                              year: movie.year,
                              originalLanguage:movie.originalLanguage ,
                              release_date: movie.release_date,
                              backdropPath: movie.backdropPath ??
                                  movie.posterPath ??
                                  '');
                          if (bookMark.checkItem(itemModel) == true) {
                          } else {
                            bookMark.addItem(itemModel);
                          }
                          //print(product.id.toString());
                          // Navigator.pushNamed(context, DetailsScreen.routeName,arguments: MovieDetailsArguments(movie: movie!));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(movie: movie)));
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 180,
                              width: 150,
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500${movie?.backdropPath ?? movie?.posterPath ?? ''}',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              width: 150,
                              child: Text(
                                '${movie.title}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 14,
                                  ),
                                  Text(
                                    '${movie.voteAverage}',
                                    style: TextStyle(
                                      color: Colors.yellow,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10.0)),
                                      color: Colors.yellow,
                                      child: Padding(
                                        padding: EdgeInsets.all(5),
                                        child:
                                       Text('IDMB ${movie.voteAverage}',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      )),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                // Container(
                                //   decoration: BoxDecoration(
                                //     gradient: LinearGradient(
                                //       begin: Alignment.topRight,
                                //       end: Alignment.bottomLeft,
                                //       colors: [
                                //         Colors.blue,
                                //         Colors.red,
                                //       ],
                                //     )
                                // ),
                                //  child: Icon(
                                //     Icons.favorite,
                                //     size: 14,
                                //   ),
                                // ),

                                Icon(
                                  Icons.favorite_rounded,
                                  size: 24,
                                  color: primarycolor,
                                ),
                                SizedBox(width: 60),
                                Icon(
                                  Icons.play_circle_outline_outlined,
                                  size: 24,
                                  color: Colors.purpleAccent,
                                ),
                              ],
                            )
                          ],
                        )),
                  );
                });
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
    );
  }
}

Future<Result> convertFromJsonToModel(Future<http.Response> response) async {
  final responseResult = await response;
  if (responseResult.statusCode == 200) {
    final jsMap = jsonDecode(responseResult.body);
    return Result.fromJson(jsMap);
  }
  return null;
}
