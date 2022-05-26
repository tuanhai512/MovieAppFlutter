// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/model/movie.dart';

const String apiKey = '4ae1e5293ba6fd59113497bcb53718b9';
List<Movie> results = [];
var data = [];

class Client {
  var baseUrl = 'https://api.themoviedb.org/3';

  Future<http.Response> getPopular() async {
    var url = Uri.parse(
        "$baseUrl/movie/popular?api_key=$apiKey&language=vi-US&page=1");
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  Future<http.Response> getTopRate() async {
    var url = Uri.parse(
        "$baseUrl/movie/top_rated?api_key=$apiKey&language=vi-US&page=5");
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }
  Future<List<Movie>> getmovieList({String query}) async {
    var url = Uri.parse("$baseUrl/movie/popular?api_key=$apiKey&language=vi-US&page=5");
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {

        data = json.decode(response.body);
        results = data.map((e) => Movie.fromJson(e)).toList();
        if (query!= null){
          results = results.where((element) => element.originalLanguage.toLowerCase().contains((query.toLowerCase()))).toList();
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
  Future<http.Response> getNowPlaying() async {
    var url = Uri.parse("$baseUrl/movie/now_playing?api_key=$apiKey&page=5");
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  Future<http.Response> getUpComing() async {
    var url = Uri.parse("$baseUrl/movie/upcoming?api_key=$apiKey&page=5");
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }
  Future<http.Response> getCategory() async {
    var url = Uri.parse("$baseUrl/genre/movie/list?api_key=$apiKey&language=vi-US");
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }



  Future<http.Response> getMoviebyCategory(int id) async {
    var url = Uri.parse("$baseUrl/discover/movie?api_key=$apiKey&with_genres=$id&language=vi-US");
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }
  //
  // Future<Movie> getMovieDetail(int movieId) async {
  //   try {
  //     // final response = await _dio.get('$baseUrl/movie/$movieId?$apiKey');
  //     var url = Uri.parse('$baseUrl/movie/$movieId?$apiKey');
  //
  //     Movie movieDetail = Movie.fromJson(url.data);
  //
  //     movieDetail.trailerId = await getYoutubeId(movieId);
  //
  //     // movieDetail.movieImage = await getMovieImage(movieId);
  //     //
  //     // movieDetail.castList = await getCastList(movieId);
  //
  //     return movieDetail;
  //   } catch (error, stacktrace) {
  //     throw Exception(
  //         'Exception accoured: $error with stacktrace: $stacktrace');
  //   }
  // }
  //
  Future<http.Response> getYoutubeId(int id) async {
    try {
      // final response = await _dio.get('$baseUrl/movie/$id/videos?$apiKey');
      var url = Uri.parse(
          'https://api.themoviedb.org/3/movie/$id/videos?api_key=4ae1e5293ba6fd59113497bcb53718b9&language=en-US');
      var response = await http.get(url);
      // var youtubeId =  url.data!['results'][0]['key'];
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      return response;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

//  Future<List<Movie>> getNowPlayingMovie() async {
//     try {
//       final url = '$baseUrl/movie/now_playing?$apiKey';
//       final response = await _dio.get(url);
//       var movies = response.data['results'] as List;
//       List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
//       return movieList;
//     } catch (error, stacktrace) {
//       throw Exception(
//           'Exception accoured: $error with stacktrace: $stacktrace');
//     }
//   }

}
