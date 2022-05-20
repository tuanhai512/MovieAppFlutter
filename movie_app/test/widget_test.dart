// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:movie_app/model/movie.dart';
import 'package:movie_app/network/client.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

void main() {
  test("Test api", () async {
    Client client = Client();
    http.Response response = await client.getYoutubeId(675353);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      // final movies = Movie.fromJson(json);
      // prints(movies.backdropPath);
    } else
      return print("false");
  });
}
