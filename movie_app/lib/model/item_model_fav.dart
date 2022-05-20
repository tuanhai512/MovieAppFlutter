import 'package:flutter/material.dart';

class ItemModel {
  String backdropPath;
  int id, year, vote_count;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String release_date;
  String title;
  bool video;
  int voteCount;
  String voteAverage;
  bool status;
  String error;
  List genre_ids;

  ItemModel(
      {this.backdropPath,
      this.id,
      this.genre_ids,
      this.vote_count,
      this.year,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.release_date,
      this.title,
      this.video,
      this.voteCount,
      this.voteAverage});
}
