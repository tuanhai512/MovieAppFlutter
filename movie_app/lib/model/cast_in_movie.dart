import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)

class Result {
  Result({
    this.id,
    this.cast,
  });
  List<Cast> cast;
  int id;
  static List<Cast> data = [];

  factory Result.fromJson(Map<String, dynamic> json) {
    final results = json['cast'] as List<dynamic>;
    if (json == null) {
      return Result(
        cast: [],
        id:0
      );
    }

    return Result(
      cast: (json['cast'] as List<dynamic>)
          ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json["id"],

    );
  }
  @override
  String toString() {
    return 'Cast{cast: $cast,id:$id}';
  }
}

class Cast {
  int id,gender,cast_id,order;
  String   known_for_department,name,profile_path,credit_id,character,original_name;
  bool adult;
  double popularity;
  Cast({ this.id,
    this.name,this.popularity,this.adult,this.cast_id,
    this.character,this.credit_id,this.gender,
    this.known_for_department,
    this.order,this.original_name,this.profile_path});

  factory Cast.fromJson(dynamic json) {
    if (json == null) {
      return Cast(id: 0,
          name: '',
        popularity: 0.0,
        adult: false,
        cast_id: 0,
        character: '',
        credit_id: '',
        gender: 0,
        known_for_department: '',
        order: 0,
        original_name: '',
        profile_path: ''
      );
    }

    return Cast(
      id: json['id'] as int,
      name: json['name'] as String,
      popularity: json['popularity'] as double,
      adult: json['adult'] as bool,
      cast_id: json['cast_id'] as int,
      character: json['character'] as String,
      credit_id: json['credit_id'] as String,
      gender: json['gender'] as int,
      known_for_department: json['known_for_department'] as String,
      order: json['order'] as int,
      original_name: json['original_name'] as String,
      profile_path: json['profile_path'] as String,

   );
  }
}
