import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/model/movie.dart';

class ProductPopular extends StatelessWidget {
  // final products = Products.init();

  @override
  Widget build(BuildContext context) {
    // var productsAPI = Utilities().getProducts();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                'Popular Products ',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent),
              )),
              Text(
                'See more',
                style: TextStyle(fontSize: 16, color: Colors.lightBlue),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  // itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    return ProductItem(
                      // product: products[index],
                    );
                  })),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(

            width: 200,
            height: 200
          ),
          Row(
            children: [

              Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.lightBlueAccent),

              ),
            ],
          )
        ],
      ),
    );
  }
}
