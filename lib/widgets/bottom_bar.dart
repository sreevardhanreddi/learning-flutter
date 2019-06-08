import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.compare_arrows),
        title: Text('converter'),
      ),
      // BottomNavigationBarItem(
      //   icon: Icon(Icons.info),
      //   title: Text('text'),
      // ),
    ]);
  }
}
