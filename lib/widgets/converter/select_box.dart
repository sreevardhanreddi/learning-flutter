import 'package:flutter/material.dart';
import 'package:forex_mock/utils/currencies.dart';

class FromSelectBox extends StatefulWidget {
  FromSelectBox({Key key}) : super(key: key);

  _FromSelectBoxState createState() => _FromSelectBoxState();
}

class _FromSelectBoxState extends State<FromSelectBox> {
  String dropDownValue = CountryCodesList[0][1];

  _onChange(data) {
    setState(() {
      dropDownValue = data;
      print('drop down values is ');
      print(dropDownValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<String>(
        value: dropDownValue,
        onChanged: _onChange,
        items: CountryCodesList.map(
          (data) => DropdownMenuItem(
                value: data[1],
                child: Text(
                  data[0],
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
        ).toList(),
      ),
    );
  }
}
