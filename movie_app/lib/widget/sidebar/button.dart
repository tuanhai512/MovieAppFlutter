import 'package:flutter/material.dart';

import '../../constants.dart';

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key key,
    this.icon,
    this.text,
    this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
        // style: ElevatedButton.styleFrom(
        //   minimumSize: Size.fromHeight(50),
        // ),
        // child: buildContent(),
        icon: new Icon(
          Icons.menu,
          color: iconHeader,
        ),

        onPressed: onClicked,
      );

  Widget buildContent() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28),
        ],
      );
}
