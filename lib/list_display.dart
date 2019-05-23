import 'package:flutter/material.dart';
import './container_block.dart';
import './section_layout.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

/////////////////////////
///
///  https://stackoverflow.com/questions/45669202/how-to-add-a-listview-to-a-column-in-flutter
///
/////////////////////////

class FixedListView extends StatefulWidget {
  @override
  _FixedListViewState createState() => _FixedListViewState();
}

class ListData extends StatelessWidget {
  List data = [];
  ListData(data) {
    print('inside list');
    print(data);
    this.data = data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: this.data.length,
        padding: EdgeInsets.all(10.0),
        itemBuilder: (BuildContext context, int index){
          return ContainerBlock(this.data[index]);
        },
        // children: this.data.map((data) => ContainerBlock(data)).toList(),
      ),
    );
  }

  // below implemention is good for small fixed size lists
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: ListView(
  //       padding: EdgeInsets.all(10.0),
  //       children: this.data.map((data) => ContainerBlock(data)).toList(),
  //     ),
  //   );
  // }
}

String url = 'https://jsonplaceholder.typicode.com/photos/?_limit=100';

Future<dynamic> getFixedData() async {
  var client = http.Client();
  var response = await client.get(url);
  var data = [];
  data = json.decode(response.body);
  // print(data);
  return data;
}

class _FixedListViewState extends State<FixedListView> {
  var data = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: RaisedButton(
              child: Text('get fixed list'),
              color: Colors.greenAccent,
              onPressed: () async {
                var res = await getFixedData();
                setState(() {
                  this.data = res;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20.0),
              child: ListData(data),
            ),
          )
        ],
      ),
    );
  }
}
