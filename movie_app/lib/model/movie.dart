import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(explicitToJson: true)
class Result {
    Result({
       this.page,
       this.results,
       this.totalPages,
       this.totalResults,
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
         this.adult,
         this.backdropPath,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
       this.voteAverage,
       this.voteCount,
    });

    static List<Movie> init() {
      List<Movie> data = [
      Movie(
          ),
      ];
      return data;
    }
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



