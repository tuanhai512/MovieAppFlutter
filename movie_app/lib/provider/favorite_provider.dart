import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/model/item_model_fav.dart';
import 'package:movie_app/model/item_model_his.dart';
import 'package:movie_app/network/client.dart';

class FavoriteProvider extends ChangeNotifier {
  List<ItemModelFav> items = [];

  void addItem(ItemModelFav data) {
    // for (int i = 0; i < items.length - 1; i++) {

    items.add(data);
    print(data.title);
    print(items.length);

    Fluttertoast.showToast(
        msg: "Đã thêm vào danh sách yêu thích",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
notifyListeners();
    // }
  }
bool check;
  bool checkItem(ItemModelFav data) {
    print(data.title);

    if ((items.firstWhere((myData) => myData.title == data.title,
            orElse: () => null)) !=
        null) {
      return true;
    } else if ((items.firstWhere((myData) => myData.title == data.title,
            orElse: () => null)) ==
        null) {
      return false;
    }
    return false;
  }

  void removeItem(ItemModelFav data) {
    items.remove(data);
    Fluttertoast.showToast(
        msg: "Đã xóa phim khỏi danh sách yêu thích",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    notifyListeners();
  }

  List<ItemModelFav> get itemList {
    return items;
  }
}
