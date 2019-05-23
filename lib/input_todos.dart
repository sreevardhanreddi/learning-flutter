import 'package:flutter/material.dart';
import './button.dart';

class InputContainer extends StatefulWidget {
  @override
  _InputContainerState createState() => _InputContainerState();
}

class _InputContainerState extends State<InputContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (text) {
                print(text);
              },
            ),
          ),
          ButtonWidget(),
        ],
      ),
    );
  }
}
