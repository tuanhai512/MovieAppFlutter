import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_cate.dart';

class TitleDurationAndFabBtn extends StatelessWidget {
  const TitleDurationAndFabBtn({  Key key,  this.movie_cate, }) : super(key: key);

  final Movie_Cate movie_cate;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie_cate.title?? '',
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 20 / 2),

                Row(
                  children: <Widget>[
                    Text(
                      movie_cate.release_date??'',
                      style: TextStyle(color: Color(0xFF9A9BB2)),
                    ),
                    SizedBox(width: 20),

                    SizedBox(width: 20),
                    Text(
                      '${movie_cate.popularity}',
                      style: TextStyle(color: Color(0xFF9A9BB2)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Thể loại : ${movie_cate.genre_ids}'),

                  ],
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
