import 'package:flutter/material.dart';
import '../utils/currencies.dart';

class ListItem extends StatelessWidget {
  String country;
  double rate;
  Map data;
  // String country1;

  ListItem(this.country, this.rate){
    print(this.country);
    print(this.rate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Card(
        elevation: 3.0,
        // margin: EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 50.0,
              alignment: Alignment.center,
              child: Text(
                country.toString(),
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
              alignment: Alignment.center,
              child: Text(
                rate.toString(),
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
