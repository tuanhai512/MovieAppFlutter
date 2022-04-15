// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

const String apiKey= '4ae1e5293ba6fd59113497bcb53718b9';
class Client {
  var baseUrl = 'https://api.themoviedb.org/3';
  Future <http.Response> getPopular()async {
    var url=Uri.parse("$baseUrl/movie/popular?api_key=$apiKey&page=1");
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }
}
