import 'package:json_annotation/json_annotation.dart';

//part 'movie.g.dart';

@JsonSerializable(explicitToJson: true)
class ResultDetail {
  ResultDetail({
    this.id,
    this.results,
  });
  static List<MovieDetail> data = [];
  int id;
  List<MovieDetail> results;

  factory ResultDetail.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as List<dynamic>;
    if (json == null) {
      return ResultDetail(results: [], id: null);
    }

    return ResultDetail(
      id: json["id"],
      results: (json['results'] as List<dynamic>)
          ?.map((e) => MovieDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'Movie{page: $id, results: $results}';
  }
}

class MovieDetail {
  String iso_639_1;
  String iso_3166_1;
  String name;
  String key;
  String site;
  String type;
  bool official;
  String title;
  bool video;
  String published_at;
  String id;
  int size;
  bool status = false;
  MovieDetail(
      {this.id,
      this.iso_3166_1,
      this.iso_639_1,
      this.key,
      this.name,
      this.official,
      this.published_at,
      this.site,
      this.type,
      this.title,
      this.video,
      this.size});

  factory MovieDetail.fromJson(dynamic json) {
    if (json == null) {
      return MovieDetail(
          iso_639_1: "",
          key: "",
          name: "",
          official: true,
          published_at: "",
          site: "",
          type: "",
          id: "",
          title: '',
          video: true,
          size: null);
    }

    return MovieDetail(
      id: json['id'] as String,
      iso_639_1: json['iso_639_1'] as String,
      key: json['key'] as String,
      name: json['name'] as String,
      official: json['official'] as bool,
      published_at: json['published_at'] as String,
      site: json['site'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      video: json['video'] as bool,
      size: json['size'] as int,
    );
  }
}

// import 'package:json_annotation/json_annotation.dart';
// part 'movie.g.dart';

// @JsonSerializable(explicitToJson: true)
// class Results {
//   late int page;
//   late List<Results> results;
//   late int totalPages;
//   late int totalResults;

//   Results();
//   factory Results.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
//   Map<String, dynamic> toJson() => _$MovieToJson(this);

//   @override
//   String toString() {
//     return 'Movie{page: $page, totalResults: $totalResults, totalPages: $totalPages, results: $results}';
//   }
// }

// @JsonSerializable()
// class Movie {
//   late bool adult;
//   late String backdropPath;
//   late List<int> genreIds;
//   late int id;
//   late String originalLanguage;
//   late String originalTitle;
//   late String overview;
//   late double popularity;
//   late String posterPath;
//   late String releaseDate;
//   late String title;
//   late bool video;
//   late double voteAverage;
//   late int voteCount;

//   Movie();
//  factory Movie.fromJson(Map<String, dynamic> json) => _$ResultsFromJson(json);
//   Map<String, dynamic> toJson() => _$ResultsToJson(this);

// }
