import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import '../../constants.dart';
class MenuHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(color: primarycolor),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
               mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                 
                    child: Text(
                  "Account info",
                  
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Save",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            )));
  }
}
