import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(

       mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: TextField(

            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Search movie",
                prefixIcon: Icon(Icons.search)),
          ),
        ),
        // GestureDetector(
        //   child: Container(
        //       height: 40,
        //       width: 40,
        //       padding: EdgeInsets.all(10),
        //       child: Icon(Icons.shopping_cart_outlined)),
        // )
      ],
    );
  }
}
