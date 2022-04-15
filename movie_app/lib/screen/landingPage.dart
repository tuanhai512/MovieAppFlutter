

// ignore: unnecessary_import
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/network/client.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'dart:convert';

class landingPage extends StatefulWidget {

  @override
  State<landingPage> createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
 
 Client client = Client();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie"),
      ),
      body: FutureBuilder<Result?>(
        future: convertFromJsonToModel(client.getPopular()),
        builder: (BuildContext context, snapshot) { 
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasData){
            if(snapshot.data?.results?.length == 0){
              return Center(
                child: Text("Empty"),
              );
            }
            else{
              return ListView.builder(
                itemCount: snapshot.data?.results?.length,
                itemBuilder: (ctx, index) {
                  Movie? movie = snapshot.data?.results?[index];
                return Card(
                  child: ListTile(
                  leading: Icon(Icons.movie),
                  title: Text(movie?.title??'Không có dữ liệu'),
                )
                );
              });
            }
          }
          if(snapshot.hasError){
            return Center(child: Text("Error ${snapshot.error}"),);
          }
          return Center(child: Text("Error"),);
         },),
    );
  }

  Future<Result?> convertFromJsonToModel(Future<http.Response> response)async{
      final responseResult = await response;
      if(responseResult.statusCode == 200){
        final jsMap =   jsonDecode(responseResult.body);
        return Result.fromJson(jsMap);
      }
    return null;
  }
}