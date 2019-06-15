import 'package:flutter/material.dart';
import '../utils/fetch_data.dart';
import 'dart:async';
import './future_builder_widget.dart';

class CurrencyList extends StatelessWidget {
  Map<String, double> ratesData = {};

  CurrencyList(this.ratesData) {
    print('stateless widget rates data');
    print(this.ratesData);
  }

  @override
  Widget build(BuildContext context) {
    Widget _displayWidget = (ratesData.length > 0)
        ? FutureDataWidget(ratesData)
        : Center(
            child: SizedBox(
              height: 150.0,
              width: 150.00,
              child: CircularProgressIndicator(
                strokeWidth: 5.0,
              ),
            ),
          );

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _displayWidget,
        ],
      ),
    );
    ;
  }
}

// class CurrencyList extends StatefulWidget {
//   var data = {};

//   CurrencyList(this.data);
//   @override
//   _CurrencyListState createState() => _CurrencyListState();
// }

// class _CurrencyListState extends State<CurrencyList> {
//   Map<String, double> currencyListData = {};

//   @override
//   void initState() {
//     print('in init state');
//     if (currencyListData.length < 0) {
//       fetchRatesData().then((onValue) => {
//             setState(() {
//               currencyListData = onValue;
//             })
//           });
//     }
//     currencyListData = currencyListData;
//     super.initState();
//   }

//   Widget _displayWidget = (data.length > 0)
//       ? Text('cool')
//       : Center(child: CircularProgressIndicator());
//   @override
//   Widget build(BuildContext context) {
//     print('build');

//     return Container(
//       child: Column(
//         children: <Widget>[
//           _displayWidget,
//         ],
//       ),
//     );
//   }
// }

// class _CurrencyListState extends State<CurrencyList> {
//   Map<String, double> currencyListData = {};
//   Future useFuture;
//   @override
//   void initState() {
//     useFuture = fetchRatesData();
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: <Widget>[
//           FutureBuilder(
//               future: useFuture,
//               builder: (context, AsyncSnapshot snapshot) {
//                 if (snapshot.hasData) {
//                   currencyListData = snapshot.data;
//                   return FutureDataWidget(snapshot.data);
//                 } else if (snapshot.hasError) {
//                   return Text(snapshot.error.toString());
//                 } else {
//                   return Container(
//                     alignment: Alignment.center,
//                     child: Center(
//                       child: CircularProgressIndicator(),
//                     ),
//                   );
//                 }
//               })
//         ],
//       ),
//     );
//   }
// }
