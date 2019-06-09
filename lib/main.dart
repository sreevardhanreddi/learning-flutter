import 'package:flutter/material.dart';
import './widgets/currency_list.dart';
import './utils/fetch_data.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedItemIndex = 0;
  Map<String, double> _data = {};

  _onItemTapped(int indexElement) {
    print('item elements index tapped ${indexElement}');
    setState(() {
      _selectedItemIndex = indexElement;
    });
  }

  @override
  void initState() {
    print('init state in main');
    fetchRatesData().then((data) => {
          setState(() {
            print('set state');
            print(data);
            _data = data;
            print(_data);
          })
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> appWidgets = [
      CurrencyList(_data),
      Center(
        child: Text(
          'widget 2 aka converter',
          style: TextStyle(
            fontSize: 50.0,
          ),
        ),
      )
    ];

    print('in main build');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Forex app'),
        ),
        body: appWidgets[_selectedItemIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.compare_arrows),
              title: Text('converter'),
            ),
          ],
          currentIndex: _selectedItemIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.blue,
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   int selectedItemIndex = 0;

//   List<Widget> appWidgets = [
//     CurrencyList(),
//     Center(
//       child: Text('widget 2 aka converter'),
//     )
//   ];

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('app'),
//         ),
//         body: appWidgets[BottomBar.selectedIndexElement],
//         bottomNavigationBar: BottomBar(),
//       ),
//     );
//   }
// }
