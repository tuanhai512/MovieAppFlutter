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
                hintText: "Tên phim.....",)
                // prefixIcon: Icon(Icons.search)),
          ),
        ),SizedBox(child: Icon(Icons.search),width: 60,)
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
