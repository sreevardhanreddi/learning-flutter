import 'package:flutter/material.dart';
import '../utils/fetch_data.dart';
import './future_builder_widget.dart';

class CurrencyList extends StatefulWidget {
  @override
  _CurrencyListState createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  Map<String, double> currencyListData = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          FutureBuilder(
              future: fetchRatesData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  currencyListData = snapshot.data;
                  return FutureDataWidget(snapshot.data);
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return Container(
                    alignment:Alignment.center,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              })
        ],
      ),
    );
  }
}
