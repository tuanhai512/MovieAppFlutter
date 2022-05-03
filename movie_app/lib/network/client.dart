// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:movie_app/model/movie.dart';

const String apiKey = '4ae1e5293ba6fd59113497bcb53718b9';

class Client {
  var baseUrl = 'https://api.themoviedb.org/3';

  Future<http.Response> getPopular() async {
    var url = Uri.parse("$baseUrl/movie/now_playing?api_key=$apiKey&page=5");
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  Future<http.Response> getTopRate() async {
    var url = Uri.parse("$baseUrl/movie/now_playing?api_key=$apiKey&page=5");
    var reponse = await http.get(url);
     var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
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
