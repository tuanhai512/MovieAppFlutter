import 'package:flutter/material.dart';
import 'package:movie_app/home/component/fragment/home_frag/movie_latest.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movie_app/home/component/fragment/home_frag/category_movie.dart';
import 'package:movie_app/model/category.dart';
import '../../details/components/cast.dart';
import '../../model/movie_cate.dart';

class TitleDurationAndFabBtn extends StatelessWidget {
  const TitleDurationAndFabBtn({
    Key key,
    this.movie_cate,
  }) : super(key: key);

  final Movie_Cate movie_cate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                checkAdult(movie_cate.adult),
                SizedBox(
                  width: 40,
                ),
                Text(
                  '${movie_cate.original_language}',
                  style: TextStyle(color: Color(0xFF9A9BB2)),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Thể loại : ${movie_cate.genre_ids}\n'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget checkAdult(id) {
  if (id == true) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)
            ,color: Colors.orangeAccent),
        padding: EdgeInsets.all(5),
        child: Text("Trên 16 tuổi",
            style:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold)));
  } else {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)
            ,color: Colors.greenAccent),
        padding: EdgeInsets.all(5),
        child: Text("Dành cho mọi lứa tuổi",
            style:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold)));
  }
}
