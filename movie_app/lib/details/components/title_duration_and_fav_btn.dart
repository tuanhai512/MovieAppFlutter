import 'package:flutter/material.dart';
import 'package:movie_app/details/components/genres.dart';
import '../../model/movie.dart';

class TitleDurationAndFabBtn extends StatelessWidget {
  const TitleDurationAndFabBtn({  Key key,  this.movie, }) : super(key: key);

  final Movie movie;

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
                  movie.title?? '',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Genres(movie: movie),
                SizedBox(height: 20 / 2),

                Row(
                  children: <Widget>[
                    Text(
                      movie.release_date??'',
                      style: TextStyle(color: Color(0xFF9A9BB2)),
                    ),
                    SizedBox(width: 20),

                    SizedBox(width: 20),
                    Text(
                      '${movie.popularity}',
                      style: TextStyle(color: Color(0xFF9A9BB2)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Ngôn ngữ : ${movie.originalLanguage}'),

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
