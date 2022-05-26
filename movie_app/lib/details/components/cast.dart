import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:movie_app/network/client.dart';
import '../../model/cast_in_movie.dart';

class ListCast extends StatelessWidget {
  ListCast({
    Key key,
    this.id,
  }) : super(key: key);
  int id;
  @override
  Widget build(BuildContext context) {
    Client client = Client();

    return FutureBuilder<Result>(
      future: convertFromJsonToModel(client.getCastInMovie(id)),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              // child: CircularProgressIndicator(),
              );
        }
        if (snapshot.hasData) {
          if (snapshot.data.cast.length == 0) {
            return Center(
              child: Text("Empty"),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.cast?.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                Cast cast = snapshot.data.cast[index];
                return Container(
                  margin:EdgeInsets.all(5) ,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8), // Border width
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(30), // Image radius
                            child: Image.network(
                                'https://image.tmdb.org/t/p/w500${cast.profile_path}',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Text('${cast.name}')
                    ],
                  ),
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
