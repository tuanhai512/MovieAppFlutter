import 'package:flutter/material.dart';
import 'package:movie_app/widget/sidebar/body.dart';
import 'package:movie_app/widget/sidebar/button.dart';

import '../../widget/search/searchpage.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: ButtonWidget(
            onClicked: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),

        Expanded(
          child: IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchMovie());
            },
            icon: Icon(Icons.search_sharp),
          ),
        ),

        // Expanded(
        //   child: TextField(
        //     decoration: InputDecoration(
        //         filled: true,
        //         fillColor: Colors.white,
        //         hintText: "Tên phim.....",
        //     )
        //         // prefixIcon: Icon(Icons.search)),
        //   ),
        // ),
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
            // Navigator.pushNamed(context, CartPage.routeName);
