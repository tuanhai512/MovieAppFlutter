import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class Genres {
  Genres({this.genres, this.id, this.name});
  List<Category> genres;
  String id;
  String name;
  List<Genres> genre;
  static List<Category> data = [];

  factory Genres.fromJson(Map<String, dynamic> json) {
    final results = json['genres'] as List<dynamic>;
    final id = json['genres_id'] as String;
    final name = json['genres_name'] as String;
    if (json == null) {
      return Genres(genres: []);
    }

    return Genres(
      genres: (json['genres'] as List<dynamic>)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  @override
  String toString() {
    return 'Category{genres: $genres}';
  }
}

class Category {
  int id;
  String name;

  Category({this.id, this.name});

  factory Category.fromJson(dynamic json) {
    if (json == null) {
      return Category(id: 0, name: '');
    }

    return Category(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}
