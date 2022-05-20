import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movie_app/home/component/fragment/home_frag/category_movie.dart';
import 'package:movie_app/model/category.dart';
import 'package:movie_app/network/client.dart';
import 'package:movie_app/widget/change_theme_button.dart';
import 'package:movie_app/widget/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);


  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'DarkTheme'
        : 'LightTheme';
    // final name = 'Sarah Abs';
    // final email = 'sarah@abs.com';
    // final urlImage =
    //     'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';
    Client client = Client();

    return Drawer(
        child: Material(
            color: backgroundH,
            child: Column(
              children: [
                Row(
                  
                  children: [
                    
                    Expanded(child:  Text('Change Theme',style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      
                    )))
                   , Expanded(child: SizedBox(width: 0,))
                    ,ChangeThemeButtonWidget()],
                ),
                Center(
                    child: Text('The loai',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ))
                ),
                Expanded(
                  child:
                      // padding:  EdgeInsets.symmetric(horizontal: 20) ,
                      // child:
                      FutureBuilder<Genres>(
                          future: convertFromJsonToModel(client.getCategory()),
                          builder: (BuildContext context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                  // child: CircularProgressIndicator(),
                                  );
                            }
                            if (snapshot.hasData) {
                              if (snapshot.data?.genres?.length == 0) {
                                return Center(
                                  child: Text("Empty"),
                                );
                              } else {
                                return ListView.builder(
                                  padding:padding ,
                                    itemCount: snapshot.data.genres.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (ctx, index) {
                                      Category cate =
                                          snapshot.data.genres[index];

                                      return Column(
                                        children: [
                                          const SizedBox(height: 12),
                                          GestureDetector(
                                            onTap: () {
                                              //print(product.id.toString());
                                              // Navigator.pushNamed(context, DetailsScreen.routeName,arguments: MovieDetailsArguments(movie: movie!));
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Cate_Movie(
                                                            // movie_cate:cate.id,
                                                            id: cate.id  ,
                                                          )));
                                            },
                                            child: Row(children: [
                                              Icon(
                                                Icons.movie,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(width: 16),
                                              Text(
                                                ''
                                                '${cate.name}',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ]),
                                          ),
                                          const SizedBox(height: 12),
                                        ],
                                      );
                                    });
                              }
                            }
                            if (snapshot.hasError) {
                              return Center(
                                child: Text("Error ${snapshot.error}"),
                              );
                            }
                            return Center(
                              child: Text("Error"),
                            );
                          }),
                )
              ],
            ))

        // buildHeader(
        //   urlImage: urlImage,
        //   name: name,
        //   email: email,
        //   onClicked: () => Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => UserPage(
        //       name: 'Sarah Abs',
        //       urlImage: urlImage,
        //     ),
        //   )),
        // ),

        );
  }

  Widget buildSearchField() {
    return Container(child: GestureDetector(child: ChangeThemeButtonWidget()));
  }
}

Future<Genres> convertFromJsonToModel(Future<http.Response> response) async {
  final responseResult = await response;
  if (responseResult.statusCode == 200) {
    final jsMap = jsonDecode(responseResult.body);
    return Genres.fromJson(jsMap);
  }
  return null;
}
