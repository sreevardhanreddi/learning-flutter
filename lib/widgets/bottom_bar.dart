import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomBar extends StatefulWidget {
  static int selectedIndexElement = 0;
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  _onItemTapped(int indexElement) {
    print('item elements index tapped ${indexElement}');
    setState(() {
      BottomBar.selectedIndexElement = indexElement;
    });
  }

  static const List<Widget> _widgetElements = [
    Text(
      'Index 0: Home',
      style: TextStyle(
        fontSize: 50.0,
      ),
    ),
    Text(
      'Index 1: Business',
      style: TextStyle(
        fontSize: 50.0,
      ),
    ),
    Text(
      'Index 2: School',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows),
            title: Text('converter'),
          ),
        ]);
  }
}
