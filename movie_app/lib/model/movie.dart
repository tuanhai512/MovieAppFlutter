import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

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

   factory Result.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
   Map<String, dynamic> toJson() => _$MovieToJson(this);

 @override 
  String toString() {
    return 'Movie{page: $page, totalResults: $totalResults, totalPages: $totalPages, results: $results}';
   }
 
}
@JsonSerializable()
class Movie {
    Movie({
        required this.adult,
        required this.backdropPath,
        required this.genreIds,
        required this.id,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.releaseDate,
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    bool? adult;
    String? backdropPath;
    List<int>? genreIds;
    int? id;
    String? originalLanguage;
    String? originalTitle;
    String? overview;
    double? popularity;
    String? posterPath;
    String? releaseDate;
    String? title;
    bool? video;
    double? voteAverage;
    int? voteCount;

     
 factory Movie.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);

    
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


