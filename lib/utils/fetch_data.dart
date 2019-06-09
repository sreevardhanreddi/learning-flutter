import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import './api_url.dart';

Map<String, double> currencyListData = {};

Future<Map<String, double>> fetchRatesData() async {
  var client = new http.Client();
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
}
