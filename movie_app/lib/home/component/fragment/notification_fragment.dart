import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';

class NotificationFrag extends StatelessWidget {
  List<Movie> movie;

  NotificationFrag(this.movie);

  @override
  Widget build(BuildContext context) {
     print(movie.length.toString());
    return Expanded(
      child: Container(
        child: ListView.builder(
            itemCount: movie.length,
            itemBuilder: (context, index) {
              return ProductItemList(
                movie: movie[index],
              )
              ;
            }
            ),
      ),
    );
  }
}

class ProductItemList extends StatelessWidget {

  Movie movie;

  ProductItemList({required  this.movie });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie?.backdropPath ?? movie?.posterPath ?? ''}',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: SizedBox(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${movie.title}'),
                      Expanded(
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(10.0)),
                              color: Colors.yellow,
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child:
                                Text('IDMB ${movie!.voteAverage}',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    )),
                              )),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
  }

