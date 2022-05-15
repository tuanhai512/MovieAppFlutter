import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:movie_app/details/details_screen.dart';
import 'package:movie_app/home/component/homeheader.dart';
import 'package:movie_app/model/movie_cate.dart';
import 'package:movie_app/network/client.dart';

class Cate_Movie extends StatelessWidget {
  static String routeName = "/cate_movie";
  Cate_Movie(
      {Key key,
      // this.movie_cate,
      this.id})
      : super(key: key);
  // final Movie_Cate movie_cate;
  int id;
  @override
  Widget build(BuildContext context) {
    Client client = Client();
    return Scaffold(
      appBar: AppBar(
        title: HomeHeader(),
      ),
      body: (FutureBuilder<Genres>(
        future: convertFromJsonToModel(client.getMoviebyCategory(id)),
        builder: (BuildContext context, snapshot) {
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
                  return Column(
                    children: [
                      // const SizedBox(height: 16),
                      Container(
                        height:200,
                          width:200,
                          decoration: BoxDecoration(
                        // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500${movie_cate.backdrop_path ?? movie_cate.poster_path ?? ''}'),
                        ),
                      )),
                      // GestureDetector(
                      //   onTap: () {
                      //     //print(product.id.toString());
                      //     // Navigator.pushNamed(context, DetailsScreen.routeName,arguments: MovieDetailsArguments(movie: movie!));
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) =>
                      //                 DetailsScreen(movie: movie_cate)));
                      //   }
                      //    ,child:

                      Text('IDMB: ${movie_cate.vote_average}'),

                      Text('${movie_cate.title}'),

                      // ),
                    ],
                  );

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
