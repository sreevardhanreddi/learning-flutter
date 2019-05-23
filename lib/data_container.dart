import 'package:flutter/material.dart';

class DataContainer extends StatelessWidget {
  String todoData;

  DataContainer(this.todoData) {
    if (this.todoData == '' || this.todoData == null) {
      this.todoData = 'some todo';
    } else {
      this.todoData = todoData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(this.todoData),
      margin: EdgeInsets.all(5.0),
    );
  }
}
