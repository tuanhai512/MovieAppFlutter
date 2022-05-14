import 'dart:convert';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:movie_app/details/details_screen.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/network/client.dart';
import 'package:quiver/strings.dart';

Client client = Client();

class MovieLatest extends StatelessWidget {
  static String routeName = '/movie_lastest';

  @override
  Widget build(BuildContext context) {
    // var productsAPI = Utilities().getProducts();
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      constraints: BoxConstraints.expand(height: 200),
      child: carouselCard(context),
    );
  }

  Widget carouselCard(context) {
    return FutureBuilder<Result>(
      future: convertFromJsonToModel(client.getTopRate()),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          if (snapshot.data?.results?.length == 0) {
            return Center(
              child: Text("Empty"),
            );
          } else {
            return new Swiper(
              itemCount: snapshot.data?.results?.length,
              autoplay: true,
              itemBuilder: (ctx, index) {
                Movie movie = snapshot.data?.results[index];

                return new Stack(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        //print(product.id.toString());
                        // Navigator.pushNamed(context, DetailsScreen.routeName,arguments: MovieDetailsArguments(movie: movie!));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailsScreen(movie: movie)));
                      },
                      child: Image.network(
                          'https://image.tmdb.org/t/p/w500${movie?.backdropPath ?? movie?.posterPath ?? ''}',
                          fit: BoxFit.fitHeight),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 5, top: 100),
                        child: Text(
                          movie?.title?.toUpperCase() ?? "",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontFamily: "null"),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                        )),
                    
                    Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color: Colors.yellow,
                        margin: EdgeInsets.fromLTRB(180, 80, 0, 0),
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            'IBM: ${movie?.voteAverage}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 8,
                                fontFamily: "null"),
                          ),
                        ))
                  ],
                );
              },
              viewportFraction: 0.7,
              scale: 0.8,
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

// class MovieItemLastest extends StatelessWidget {
//   Client client = Client();

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Result?>(
//       future: convertFromJsonToModel(client.getTopRate()),
//       builder: (BuildContext context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//                child: CircularProgressIndicator(),
//               );
//         }
//         if (snapshot.hasData) {
//           if (snapshot.data?.results?.length == 0) {
//             return Center(
//               child: Text("Empty"),
//             );
//           } else {
//             return ListView.builder(
//                 itemCount: snapshot.data?.results?.length,
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (ctx, index) {
//                   Movie? movie = snapshot.data?.results?[index];

//                   return Card(
//                     child: GestureDetector(
//                       onTap: () {
//                         //print(product.id.toString());
//                         // Navigator.pushNamed(context, DetailsScreen.routeName,arguments: MovieDetailsArguments(movie: movie!));
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     DetailsScreen(movie: movie!)));
//                       },
//                       child: Container(

//                         child: Image.network('https://image.tmdb.org/t/p/w500${movie?.backdropPath ?? movie?.posterPath ?? ''}',
//                            fit: BoxFit.fill
//                         ),
//                       ),
//                     ),
//                   );
//                 });
//           }
//         }
//         if (snapshot.hasError) {
//           return Center(
//             child: Text("Error ${snapshot.error}"),
//           );
//         }
//         return Center(
//           child: Text("Error"),
//         );
//       },
//     );
//   }
// }

  Future<Result> convertFromJsonToModel(Future<http.Response> response) async {
    final responseResult = await response;
    if (responseResult.statusCode == 200) {
      final jsMap = jsonDecode(responseResult.body);
      return Result.fromJson(jsMap);
    }
    return null;
  }
}
