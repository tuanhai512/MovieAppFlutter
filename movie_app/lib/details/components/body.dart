// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:movie_app/details/components/cast_and_crew.dart';
import 'package:movie_app/home/component/fragment/home_frag/movie_latest.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/movieDetail.dart';
import 'package:movie_app/network/client.dart';
import 'package:movie_app/playVideo/components/video.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'cast_and_crew.dart';
import 'title_duration_and_fav_btn.dart';

class Body extends StatelessWidget {
  final Movie movie;

  const Body({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // it will provide us total height and width
    client.getYoutubeId(movie.id);
    print(client.getYoutubeId(movie.id));
    // print(MovieDetail);

    Size size = MediaQuery.of(context).size;

    return FutureBuilder<ResultDetail>(
      future: convertFromJsonToModel(client.getYoutubeId(movie.id)),
      // ignore: missing_return
      builder: (context, snapshot) {
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
            return ListView.builder(
              itemBuilder: (ctx, index) {
                MovieDetail movieDetail = snapshot.data?.results[index];
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // BackdropAndRating(size: size, movie: movie),

                      Container(
                        // 40% of our total height
                        height: size.height * 0.4,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: size.height * 0.4 - 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(50)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500${movie.backdropPath ?? movie.posterPath ?? ''}'),
                                ),
                              ),
                            ),
                            // Rating Box
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                // it will cover 90% of our total width
                                width: size.width * 0.9,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(50),
                                    topLeft: Radius.circular(50),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 5),
                                      blurRadius: 50,
                                      color: Color(0xFF12153D).withOpacity(0.2),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          SvgPicture.asset(
                                              "assets/icons/star_fill.svg"),
                                          SizedBox(height: 20 / 4),
                                          Column(
                                            children: [
                                              Text('${movie.voteAverage}/10'),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                    size: 13,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                    size: 13,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                    size: 13,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                    size: 13,
                                                  ),
                                                  Icon(
                                                    Icons.star_half,
                                                    color: Colors.yellow,
                                                    size: 13,
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "${movie.vote_count} đánh giá",
                                                style: TextStyle(
                                                    color: Color(0xFF9A9BB2)),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      // Rate this
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(height: 20 / 4),
                                        ],
                                      ),
                                      // Metascore
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(height: 20 / 4),
                                          Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              color: Colors.yellow,
                                              child: Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Text(
                                                    'IDMB ${movie.voteAverage}',
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // Back Button
                            SafeArea(child: BackButton()),
                            Container(
                              height: size.height * 0.4,
                              padding: EdgeInsets.only(top: 80),
                              child: GestureDetector(
                                onTap: () async {
                                  final youtubeUrl =
                                      "https://www.youtube.com/watch?v=${movieDetail.key}}";

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Video(
                                              title: movie.title,
                                              url: youtubeUrl)));
                                },
                                child: Center(
                                    child: Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.play_arrow_outlined,
                                      color: Colors.yellow,
                                      size: 65,
                                    )
                                  ],
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20 / 2),
                      TitleDurationAndFabBtn(movie: movie),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20 / 2,
                          horizontal: 20,
                        ),
                        child: SizedBox(
                          height: 64,
                          width: 500,
                          child: FlatButton(
                            onPressed: () async {
                              final youtubeUrl =
                                  "https://www.youtube.com/watch?v=${movieDetail.key}}";
                              // print("MDT ${movieDetail.key}");
                              // if (await canLaunch(youtubeUrl)) {
                              //   launch(youtubeUrl);
                              // }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Video(
                                          title: movie.title,
                                          url: youtubeUrl)));
                            },
                            color: Color(0xFFFE6D8E),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Icon(
                              Icons.add,
                              size: 28,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20 / 2,
                          horizontal: 20,
                        ),
                        child: Text(
                          "Plot Summary \n ",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text('${movie.overview ?? ""}'),
                      )

                      // CastAndCrew(casts: movie.cast),
                    ],
                  ),
                );
              },
              itemCount: snapshot.data?.results?.length > 2 ? 1 : 0,
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

  Future<ResultDetail> convertFromJsonToModel(Future<Response> response) async {
    final responseResult = await response;
    if (responseResult.statusCode == 200) {
      final jsMap = jsonDecode(responseResult.body);
      print("convert $jsMap");
      return ResultDetail.fromJson(jsMap);
    }
    return null;
  }
}
