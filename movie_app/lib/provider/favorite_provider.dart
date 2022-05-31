import 'package:flutter/cupertino.dart';
import 'package:movie_app/model/item_model_fav.dart';
import 'package:movie_app/network/client.dart';

class FavoriteProvider extends ChangeNotifier {
  List<ItemModel> items = [];

  void addItem(ItemModel data) {
    // for (int i = 0; i < items.length - 1; i++) {

    items.add(data);
    print(data.title);
    print(items.length);
    print("cc");
    notifyListeners();

    // }
  }

  bool checkItem(ItemModel data) {
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

  void removeItem(ItemModel data) {
    
    items.remove(data);
    notifyListeners();
  }

  List<ItemModel> get itemList {
    return items;
  }
}
