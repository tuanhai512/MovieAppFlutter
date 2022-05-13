import 'package:flutter/material.dart';
 import 'package:movie_app/home/component/fragment/account_fragment.dart';
import 'package:movie_app/home/component/fragment/favorite_fragment.dart';
import 'package:movie_app/home/component/fragment/home_fragment.dart';
import 'package:movie_app/home/component/fragment/notification_fragment.dart';
import 'package:movie_app/home/component/homeheader.dart';
import 'package:movie_app/home/component/menuheader.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/constants.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var selectIndex = 0;
  var flag = true;

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      HomeFrag(),
      FavoriteFrag(),
      NotificationFrag(Result.data),
     // AccountFrag()
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.pink[300],
        automaticallyImplyLeading: false,
        title: flag ? HomeHeader() : MenuHeader(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor:Colors.pink[300] ,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectIndex,
        onTap: (index) {
          setState(() {
            selectIndex = index;
            if (selectIndex != 3)
              // if (selectIndex != 3)

              {
              flag = true;
            } else {
              flag = false;
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Yêu thích',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Lịch sử',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.account_circle),
          //   label: 'Account',
          // ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            screen[selectIndex]
          ],
        ),
      ),
    );
  }
}
