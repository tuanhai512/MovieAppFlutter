import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)

class Genres {
  Genres({
    required this.genres,
  });
  List<Category>? genres;
  static List<Category> data = [];

  factory Genres.fromJson(Map<String, dynamic>? json) {
    final results = json?['genres'] as List<dynamic>?;
    if (json == null) {
      return Genres(genres: []);
    }

    return Genres(
      genres: (json['genres'] as List<dynamic>?)
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
  int? id;
  String? name;

  Category({required this.id, required this.name});

  factory Category.fromJson(dynamic json) {
    if (json == null) {
      return Category(id: 0, name: '');
    }

    return Category(
      id: json['id'] as int?,
      name: json['name'] as String?,

    );
  }
}
