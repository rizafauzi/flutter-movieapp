import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MovieAppBar extends StatelessWidget implements PreferredSizeWidget {
  MovieAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
    );
  }
}
