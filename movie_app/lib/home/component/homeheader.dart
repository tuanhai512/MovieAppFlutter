import 'package:flutter/material.dart';
import 'package:movie_app/widget/sidebar/body.dart';
import 'package:movie_app/widget/sidebar/button.dart';

import '../../widget/search/searchpage.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      
      onClicked: () {
        Scaffold.of(context).openDrawer();
      },
    );


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
  }
}
            // Navigator.pushNamed(context, CartPage.routeName);
