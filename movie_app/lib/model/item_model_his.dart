import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/model/movie.dart';

class ItemModelFav {
  String backdropPath;
  int id, year, vote_count;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String release_date;
  String title;
  bool video,adult;
  int voteCount;
  String voteAverage;
  bool status;
  String error;
  List genre_ids;

  ItemModelFav(
      {this.backdropPath,
        this.id,
        this.genre_ids,
        this.vote_count,
        this.year,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.adult,
        this.posterPath,
        this.release_date,
        this.title,
        this.video,
        this.voteCount,
        this.voteAverage});
  factory ItemModelFav.fromJson(dynamic json) {
    if (json == null) {
      return ItemModelFav(
          genre_ids: [],
          vote_count: 0,
          backdropPath: '',
          id: 0,
          year: 0,
          originalLanguage: '',
          originalTitle: '',
          overview: '',
          popularity: 0,
          posterPath: '',
          release_date: '',
          title: '',
          adult:false,
          video: true,
          voteAverage: '',
          voteCount: 0);
    }

    return ItemModelFav(
        genre_ids: json['genre_ids'] as List,
        backdropPath: json['backdrop_path'] as String,
        id: json['id'] as int,
        vote_count: json['vote_count'] as int,
        year: json['year'] as int,
        originalLanguage: json['original_language'] as String,
        originalTitle: json['original_title'] as String,
        overview: json['overview'] as String,
        popularity: json['popularity'] as double,
        posterPath: json['poster_path'] as String,
        release_date: json['release_date'] as String,
        title: json['title'] as String,
        video: json['video'] as bool,
        adult: json['adult'] as bool,
        voteCount: json['vote_count'] as int,
        voteAverage: json['vote_average'].toString() as String );
  }
}
List<Movie> getListMovie(int id){

}



