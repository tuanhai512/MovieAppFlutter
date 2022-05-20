import 'package:flutter/cupertino.dart';
import 'package:movie_app/model/item_model_fav.dart';

class FavoriteProvider extends ChangeNotifier {
  List<ItemModel> items = [];

  void addItem(ItemModel data) {
    items.add(data);
    notifyListeners();
  }

  List<ItemModel> get itemList {
    return items;
  }
}
