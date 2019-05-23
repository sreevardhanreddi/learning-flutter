import 'package:flutter/material.dart';
import './todos_list.dart';

class ButtonWidget extends StatefulWidget {
  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  List<String> _listData = [];

  String text = 'add';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Center(
        child: RaisedButton(
          color: Colors.blue,
          child: Text(this.text),
          onPressed: () {
            _listData.add('todo check');
            setState(() {
              this.text = 'adddddddddd';
              TodosList(todosList: _listData);
            });
          },
        ),
      ),
    );
  }
}
