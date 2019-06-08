import 'package:flutter/material.dart';
import './list_item.dart';
import '../utils/currencies.dart';

class FutureDataWidget extends StatelessWidget {
  Map<String, double> rates = {};

  FutureDataWidget(this.rates);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Container(
          child: ListView(
            children: CountryCodesList.map(
                (data) => ListItem(data.join(' '), rates[data[1]])).toList(),
          ),
        ),
      ),
    );
  }
}
