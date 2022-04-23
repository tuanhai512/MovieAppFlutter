import 'package:json_annotation/json_annotation.dart';

//part 'movie.g.dart';

@JsonSerializable(explicitToJson: true)
class Result {
  Result({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  factory Result.fromJson(Map<String, dynamic>? json) {
    final results = json?['results'] as List<dynamic>?;
    if (json == null) {
      return Result(
          page: null, results: [], totalResults: null, totalPages: null);
    }

    return Result(
      page: json["page"],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json["total_pages"],
      totalResults: json["total_results"],
    );
  }

  @override
  String toString() {
    return 'Movie{page: $page, totalResults: $totalResults, totalPages: $totalPages, results: $results}';
  }
}

class Movie {
  String? backdropPath;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  int? voteCount;
  String? voteAverage;

  late String error;

  Movie(
      {required this.backdropPath,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.video,
      required this.voteCount,
      required this.voteAverage});

  factory Movie.fromJson(dynamic json) {
    if (json == null) {
      return Movie(
          backdropPath: '',
          id: 0,
          originalLanguage: '',
          originalTitle: '',
          overview: '',
          popularity: 0,
          posterPath: '',
          releaseDate: '',
          title: '',
          video: true,
          voteAverage: '',
          voteCount: 0);
    }

    return Movie(
        backdropPath: json['backdrop_path'] as String?,
        id: json['id'] as int?,
        originalLanguage: json['original_language'] as String?,
        originalTitle: json['original_title'] as String?,
        overview: json['overview'] as String?,
        popularity: json['popularity'] as double?,
        posterPath: json['poster_path'] as String?,
        releaseDate: json['release_date'] as String?,
        title: json['title'] as String?,
        video: json['video'] as bool?,
        voteCount: json['vote_count'] as int?,
        voteAverage: json['vote_average'].toString() as String?);
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


