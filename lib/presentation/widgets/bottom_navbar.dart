import 'dart:ui';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late String currentRoute = '';

  @override
  void initState() {
    super.initState();
    // currentRoute = ModalRoute.of(context)?.settings.name as String;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.2),
          borderRadius: BorderRadius.circular(15)),
      width: double.infinity,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: true ? Colors.black54 : Colors.transparent,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            Container(
              child: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
            Container(
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            Container(
              child: Icon(
                Icons.history,
                color: Colors.white,
              ),
            ),
            Container(
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
