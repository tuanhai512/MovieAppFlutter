import 'package:flutter/material.dart';
import '../../model/movie.dart';

class TitleDurationAndFabBtn extends StatelessWidget {
  const TitleDurationAndFabBtn({  Key? key, required this.movie, }) : super(key: key);

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
                SizedBox(height: 20 / 2),
                Row(
                  children: <Widget>[
                    Text(
                      movie.release_date??'',
                      style: TextStyle(color: Color(0xFF9A9BB2)),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "PG-13",
                      style: TextStyle(color: Color(0xFF9A9BB2)),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "2h 32min",
                      style: TextStyle(color: Color(0xFF9A9BB2)),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 64,
            width: 64,
            child: FlatButton(
              onPressed: () {},
              color: Color(0xFFFE6D8E),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.add,
                size: 28,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
