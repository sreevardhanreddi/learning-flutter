import 'package:flutter/material.dart';
import './data_container.dart';

class TodosList extends StatelessWidget {
  List<String> todosList = [];

  TodosList({this.todosList}) {
    if (this.todosList == null) {
      this.todosList = [];
    } else {
      print(this.todosList);
      // this.todosList.map((data) {print(data);});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Container(
          margin: EdgeInsets.all(20.0),
          // child: ListView(
          //   children: <Widget>[
          //     DataContainer('check'),
          //     DataContainer('check'),
          //     DataContainer('check')
          //   ],
          // )
          child: ListView(
              children: todosList.map((data) => DataContainer(data)).toList()),
        ),
      ),
    );
  }
}
