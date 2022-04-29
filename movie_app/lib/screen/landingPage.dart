// ignore: unnecessary_import
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/network/client.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../home/homepage.dart';

class landingPage extends StatefulWidget {
<<<<<<< HEAD
  static String routeName = '/list_movie';

=======
>>>>>>> 5605e11efcd1b65b138f9d82904565038979f622
  @override
  State<landingPage> createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
<<<<<<< HEAD



 Client client = Client();
=======
  Client client = Client();
>>>>>>> 5605e11efcd1b65b138f9d82904565038979f622

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie"),

      ),
      body: FutureBuilder<Result?>(
        future: convertFromJsonToModel(client.getPopular()),
        builder: (BuildContext context, snapshot) {
<<<<<<< HEAD
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
=======
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
>>>>>>> 5605e11efcd1b65b138f9d82904565038979f622
          }
          if (snapshot.hasData) {
            if (snapshot.data?.results?.length == 0) {
              return Center(
                child: Text("Empty"),
              );
            } else {
              return ListView.builder(
<<<<<<< HEAD
                itemCount: snapshot.data?.results?.length,
                itemBuilder: (ctx, index) {
                  Movie? movie = snapshot.data?.results?[index];
                return Card(
                  child: ListTile(
                  leading: Icon(Icons.movie),
                  title: Text(movie?.title??'Không có dữ liệu'),
                )
                );
              }

              );
=======
                  itemCount: snapshot.data?.results?.length,
                  itemBuilder: (ctx, index) {
                    Movie? movie = snapshot.data?.results?[index];

                    return Card(
                        child: ListTile(
                      leading: Container(
                          height: 80,
                          width: 80,
                          child: Image.network(
                              'https://image.tmdb.org/t/p/w500${movie?.backdropPath ?? movie?.posterPath ?? ''}')),
                      title: Text(movie?.title ?? 'Không có dữ liệu'),
                    ));
                  });
>>>>>>> 5605e11efcd1b65b138f9d82904565038979f622
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
      ),
    );
  }

<<<<<<< HEAD
  Future<Result?> convertFromJsonToModel(Future<http.Response> response)async
  {
      final responseResult = await response;
      if(responseResult.statusCode == 200){
        final jsMap =   jsonDecode(responseResult.body);
        return Result.fromJson(jsMap);
      }
=======
  Future<Result?> convertFromJsonToModel(Future<http.Response> response) async {
    final responseResult = await response;
    if (responseResult.statusCode == 200) {
      final jsMap = jsonDecode(responseResult.body);
      return Result.fromJson(jsMap);
    }
>>>>>>> 5605e11efcd1b65b138f9d82904565038979f622
    return null;
  }
}
