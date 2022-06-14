import 'package:flutter/material.dart';
import 'package:movie_app/model/item_model_fav.dart';
import 'package:movie_app/model/item_model_his.dart';

class TitleDurationAndFabBtn extends StatelessWidget {
  const TitleDurationAndFabBtn({
    Key key,
    this.movie,
  }) : super(key: key);

  final ItemModelFav movie;

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
                checkAdult(movie.adult),
                SizedBox(
                  width: 40,
                ),
                Text(
                  '${movie.originalLanguage}',
                  style: TextStyle(color: Color(0xFF9A9BB2)),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                 Text('Thể loại : ${movie.genre_ids}\n'),

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
