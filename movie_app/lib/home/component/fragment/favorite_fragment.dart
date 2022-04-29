import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';

class FavoriteFrag extends StatelessWidget {
  List<Movie> products;

  FavoriteFrag(this.products);

  @override
  Widget build(BuildContext context) {
    print(products.length.toString());
    return Expanded(
      child: Container(
        child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductItemList(

              );
            }),
      ),
    );
  }
}

class ProductItemList extends StatelessWidget {
  // Products product;
  //
  // ProductItemList({ this.product});

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
                      Text(''),
                      Expanded(
                          child: Text(
                        'Description',
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ))
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
