import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  var data;
  CardBody(data) {
    print('inside container block');
    print(data);
    this.data = data;
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            child: Image.network(data == null
                ? 'https://via.placeholder.com/600/92c952'
                : data['url']),
          ),
          Container(
            child: Text(data == null ? 'title' : data['title']),
            margin: EdgeInsets.all(5.0),
          )
        ],
      ),
    );
  }
}

class ContainerBlock extends StatelessWidget {
  var data;
  ContainerBlock(data){
    print('inside container block');
    print(data);
    this.data = data;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: CardBody(data)),
    );
  }
}

// Image.network('https://via.placeholder.com/600/92c952'),
