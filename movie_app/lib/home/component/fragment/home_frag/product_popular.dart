import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:movie_app/details/details_screen.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/network/client.dart';

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
                      'Categories',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlueAccent),
                    )),
                Text(
                  'See more',
                  style: TextStyle(fontSize: 16, color: Colors.lightBlue),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: MovieItem(
    )
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
    return FutureBuilder<Result?>(
      future: convertFromJsonToModel(client.getPopular()),
      builder: (BuildContext context, snapshot) {
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
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  Movie? movie = snapshot.data?.results?[index];

                  return Card(
                        child: GestureDetector(
                          onTap: () {
                            //print(product.id.toString());
                            // Navigator.pushNamed(context, DetailsScreen.routeName,arguments: MovieDetailsArguments(movie: movie!));
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => DetailsScreen(movie: movie!)));
                          },
                          child: Container(
                            child: Image.network('https://image.tmdb.org/t/p/w500${movie?.backdropPath ?? movie?.posterPath ?? ''}'),

                          ),
                        ),



                  );



                }
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

Future<Result?> convertFromJsonToModel(Future<http.Response> response) async {
  final responseResult = await response;
  if (responseResult.statusCode == 200) {
    final jsMap = jsonDecode(responseResult.body);
    return Result.fromJson(jsMap);
  }
  return null;
}
