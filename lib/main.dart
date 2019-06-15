import 'package:flutter/material.dart';
import './widgets/currency_list.dart';
import './utils/fetch_data.dart';
import './widgets/converter/widget_container.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedItemIndex = 0;
  bool _error = false;

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
            if (data != null) {
              print(data);
              print('set state');
              print(data);
              _data = data;
              print(_data);
            } else {
              print('not connected to internet');
              _error = true;
            }
          })
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Forex App'),
          ),
          body: Center(
            child: Text(
              'Not connected to Internet.',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
        ),
      );
    } else {
      List<Widget> appWidgets = [
        CurrencyList(_data),
        // Center(
        //   child: Text(
        //     'Converter Page',
        //     style: TextStyle(
        //       fontSize: 30.0,
        //     ),
        //   ),
        // ),
        ConverterWidget(),
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
