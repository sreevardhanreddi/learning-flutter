import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import './api_url.dart';

Map<String, double> currencyListData = {};

Future<Map<String, double>> fetchRatesData() async {
  var client = new http.Client();
  try {
    var jsonResponse = await client.get(url);
    var rates = json.decode(jsonResponse.body);
    var baseRate = rates['base'];
    rates = rates['rates'];
    // print('base rate');
    // print(baseRate);
    // print('rates');
    // print(rates);
    currencyListData['EUR'] = 1.0;
    rates.forEach((key, value) => {currencyListData[key] = value});
    return currencyListData;
  } catch (e) {
    print(e);
    return null; // actually not connected to internet or the url is wrong

  }
}

// responseFormat = {"base":"USD","rates":{"GBP":0.6195704717},"date":"2010-01-12"};

Future<Map<String, dynamic>> getConvertData(String url) async {
  try {
    var jsonResponse = await http.get(url);
    var rates = json.decode(jsonResponse.body);
    print('rates converter');
    print(rates);
    print(rates['rates']);
    return rates['rates'];
  } catch (e) {
    print(e);
    return null;
  }
}
