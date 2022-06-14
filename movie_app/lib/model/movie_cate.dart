import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class Genres {
  Genres({
    this.page,
    this.results,
  });
  List<Movie_Cate> results;
  int page;
  static List<Movie_Cate> data = [];

  factory Genres.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as List<dynamic>;
    if (json == null) {
      return Genres(results: [], page: 0);
    }

    return Genres(
      results: (json['results'] as List<dynamic>)
          ?.map((e) => Movie_Cate.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json["page"],
    );
  }
  @override
  String toString() {
    return 'Movie_Cate{results: $results,page:$page}';
  }
}

class Movie_Cate {
  int id, vote_count,year;
  double popularity,vote_average;
  List genre_ids;
  String name,
      backdrop_path,
      original_language,
      original_title,
      overview,
      poster_path,
      release_date,
      title;
bool adult;
  Movie_Cate(
      {this.id,
      this.name,
        this.adult,
      this.vote_count,
      this.vote_average,
      this.popularity,
      this.genre_ids,
      this.backdrop_path,
      this.original_language,
      this.original_title,
      this.overview,
      this.poster_path,
      this.release_date,
        this.year,
      this.title});

  factory Movie_Cate.fromJson(dynamic json) {
    if (json == null) {
      return Movie_Cate(
          id: 0,
          name: '',
          backdrop_path: '',
          original_language: '',
          original_title: '',
          overview: '',
          poster_path: '',
          release_date: '',
          title: '',
          year: 0,
          genre_ids: [],
          vote_average: 0.0,
          popularity: 0.0,
          adult: false,
          vote_count: 0);
    }

    return Movie_Cate(
      id: json['id'] as int,
      name: json['name'] as String,
      backdrop_path: json['backdrop_path'] as String,
      original_language: json['original_language'] as String,
      original_title: json['original_title'] as String,
      overview: json['overview'] as String,
      poster_path: json['poster_path'] as String,
      release_date: json['release_date'] as String,
      title: json['title'] as String,
      adult: json['adult'] as bool,
year: json['year'] as int,
      genre_ids: json['genre_ids'] as List,
      vote_average: json['vote_average'] as double,
      vote_count: json['vote_count'] as int,
      popularity: json['popularity'] as double,
    );
  }
}
