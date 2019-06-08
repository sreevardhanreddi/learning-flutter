import 'package:flutter/material.dart';
import './widgets/currency_list.dart';
import './widgets/bottom_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('app'),
        ),
        body: CurrencyList(),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
