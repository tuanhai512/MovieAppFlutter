import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/home/component/fragment/fav_frag/favorite_list.dart';
import 'package:movie_app/home/component/fragment/his_frag/history_list.dart';
import 'package:movie_app/model/category.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/network/client.dart';
import 'package:movie_app/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

import '../../../model/item_model_fav.dart';
import '../../../widget/sidebar/button.dart';

class HistoryFrag extends StatefulWidget {
  @override
  State<HistoryFrag> createState() => _HistoryFrag();
}

class _HistoryFrag extends State<HistoryFrag> {
  // List<Movie> products;
  Client client = Client();
  // FavoriteFrag(this.products);

  @override
  Widget build(BuildContext context) {
    return historyPage();
  }
}