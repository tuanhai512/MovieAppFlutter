import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:movie_app/details_movie_cate/page.dart';
import 'package:movie_app/home/component/homeheader.dart';
import 'package:movie_app/model/movie_cate.dart';
import 'package:movie_app/network/client.dart';

import '../../../../constants.dart';

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
        backgroundColor: backgroundH,
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
                  return Container(
                        height: 260,
                    child:Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child:
                        GestureDetector(
                          onTap: () {
                          Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsScreen(movie_cate: movie_cate)));
                          },
                          child:
                          Column(
                              children: [
                              Container(
                              height:170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500${movie_cate.backdrop_path ?? movie_cate.poster_path ?? ''}'),
                                ),
                              )),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            color: Colors.yellow,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: Text(
                                'IBM: ${movie_cate?.vote_average}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8,
                                    fontFamily: "null"),
                              ),
                            )),
                        Text('${movie_cate.title}'),
]
                    ))

                    //   ],
                    // ),
                  ) ,)
                    ;


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
