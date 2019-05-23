import 'package:flutter/material.dart';
import './check_http.dart';
//////////////////
///
///   https://stackoverflow.com/questions/53141752/set-the-space-between-elements-in-row-flutter
///
///////////////////

class LeftTopButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text('get fixed list'),
        onPressed: () {},
        color: Colors.yellowAccent,
      ),
      margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
    );
  }
}

class RightTopButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text('get infinite list'),
        onPressed: () {},
        color: Colors.tealAccent,
      ),
      margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
    );
  }
}

class LayoutForButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[LeftTopButton(), RightTopButton()],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    );
  }
}
