import 'package:flutter/material.dart';
import 'dart:async';
import './input_field.dart';
import 'package:forex_mock/widgets/converter/select_box.dart';
import 'package:forex_mock/widgets/converter/to_select_box.dart';
import 'package:forex_mock/utils/currencies.dart';
import 'package:flutter/services.dart';
import '../../utils/fetch_data.dart';

class ConverterWidget extends StatefulWidget {
  ConverterWidget({Key key}) : super(key: key);

  _ConverterWidgetState createState() => _ConverterWidgetState();
}

class _ConverterWidgetState extends State<ConverterWidget> {
  String _fromDropDownValue = CountryCodesList[0][1];
  String _toDropDownValue = CountryCodesList[0][1];
  double _amount = 1.0;
  double _convertedAmount = 1.0;
  bool _isfetchingData = false;
  bool _isLoading = false;

  DateTime selectedDate = DateTime.now();
  String formatedDate = DateTime.now().year.toString() +
      '-' +
      DateTime.now().month.toString() +
      '-' +
      DateTime.now().day.toString();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1999),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        formatedDate = _formatDate(selectedDate);
        print('selected date');
        print(selectedDate.toString());
      });
  }

  _formatDate<String>(DateTime date) {
    return date.year.toString() +
        '-' +
        date.month.toString() +
        '-' +
        date.day.toString();
  }

  _fromOnChange(data) {
    setState(() {
      _fromDropDownValue = data;
      print('drop down values is ');
      print(_fromDropDownValue);
    });
  }

  _onSwap() {
    setState(() {
      var temp = _toDropDownValue;
      _toDropDownValue = _fromDropDownValue;
      _fromDropDownValue = temp;
    });
  }

  _toOnChange(data) {
    setState(() {
      _toDropDownValue = data;
      print('drop down values is ');
      print(_toDropDownValue);
    });
  }

  // _changeAmount(data) {
  //   _amount= data;
  //   print(_amount);
  //   print('input amount');
  //   print(data);
  //   setState(() {
  //     print('in set state');
  //     _amount = data;
  //     print(_amount);
  //   });
  // }

  _convertAmount() {
    var urlData =
        'https://api.ratesapi.io/api/${formatedDate}?base=${_fromDropDownValue}&symbols=${_toDropDownValue}';
    // var urlData = '';
    print('url made');
    print(urlData);
    setState(() {
      _isfetchingData = true;
    });
    getConvertData(urlData).then((data) => {
          setState(() {
            _convertedAmount = data[_toDropDownValue] * _amount;
            _isfetchingData = false;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    Widget _resultWidget = _isfetchingData
        ? CircularProgressIndicator()
        : Center(
            child: Container(
              child: Text(
                'Converterd Amount : ${_convertedAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          );

    return Container(
      child: Container(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Text(
                    'Date',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    '${formatedDate}',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: 80.0,
                    child: IconButton(
                      icon: Icon(Icons.date_range),
                      color: Colors.blueAccent,
                      onPressed: () => _selectDate(context),
                      // textColor: Colors.white,
                      // child: Text('Select date'),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // InputField(),
                  DropdownButtonHideUnderline(
                    child: Container(
                      child: DropdownButton<String>(
                        value: _fromDropDownValue,
                        onChanged: _fromOnChange,
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
                    ),
                  ),
                  // FlatButton(
                  //   child: Text('Swap'),
                  //   color: Colors.greenAccent,
                  //   onPressed: () {},
                  // ),
                  IconButton(
                    icon: Icon(Icons.compare_arrows),
                    color: Colors.orange,
                    onPressed: _onSwap,
                    iconSize: 40.0,
                  ),
                  DropdownButtonHideUnderline(
                    child: Container(
                      child: DropdownButton<String>(
                        value: _toDropDownValue,
                        onChanged: _toOnChange,
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
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Center(
              child: Container(
                width: 100.0,
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    BlacklistingTextInputFormatter(new RegExp('[\\-|,\\ ]'))
                  ],
                  decoration: InputDecoration(labelText: 'Amount'),
                  onChanged: (data) {
                    setState(() {
                      if (double.tryParse(data) != null) {
                        _amount = double.tryParse(data);
                        print(_amount);
                      }
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Container(
                width: 100.0,
                child: RaisedButton(
                  child: Text('Convert'),
                  onPressed: _convertAmount,
                  color: Colors.tealAccent,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: _resultWidget,
            ),
          ],
        ),
      ),
    );
  }
}

// class ConverterWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Container(
//         child: Column(
//           children: <Widget>[
//             Container(
//               height: 200.0,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: <Widget>[
//                   // InputField(),
//                   FromSelectBox(),
//                   Text('swap button'),
//                   ToSelectBox(),
//                 ],
//               ),
//             ),
//             Container(
//               height: 100.0,
//               child: Text('input field'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
