import 'package:flutter/material.dart';

/////////////////////////////////////////
///
/// https://stackoverflow.com/questions/54990716/flutter-get-iteration-index-from-list-map
///
/// https://stackoverflow.com/questions/51127241/how-do-you-change-the-value-inside-of-a-textfield-flutter
///
/// https://stackoverflow.com/questions/54806469/onchange-textfield-move-cursor-to-start-in-flutter
///
/////////////////////////////////////////

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<String> listData = [];
  int itemIndex = 0;
  String inputData;
  String buttonText = 'Add';
  var txt = TextEditingController();

  void _moveCursorToEnd(offsetPositon) {
    txt.selection = TextSelection.collapsed(offset: offsetPositon);
  }

  void _addItem(String item) {
    this.listData.add(item);
  }

  void _updateItem(int itemIndex, String item) {
    this.listData[itemIndex] = item;
    this.buttonText = 'Add';
  }

  void _deleteItem(int itemIndex) {
    this.listData.removeAt(itemIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20.0),
            child: TextField(
              controller: txt,
              onChanged: (text) {
                setState(() {
                  this.inputData = text;
                });
              },
            ),
          ),
          Container(
            child: RaisedButton(
              child: Text(this.buttonText),
              color: Colors.blue,
              onPressed: () {
                setState(() {
                  if (this.buttonText == 'Update') {
                    this._updateItem(this.itemIndex, this.inputData);
                  } else {
                    this.listData.add(this.inputData);
                  }
                  this.txt.text = '';
                  _moveCursorToEnd(this.txt.text.length);
                  print(this.listData);
                });
              },
            ),
          ),
          (this.listData.length <= 0)
              ? Container(
                  margin: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 10.0),
                  child: Text('Add todos', style: TextStyle(
                    fontSize: 50.0,
                  ),),
                )
              : Container(
                  child: Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      child: ListView(
                          children: this
                              .listData
                              .asMap()
                              .map(
                                (index, data) => MapEntry(
                                    index,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        InkWell(
                                          onTap: () {
                                            print(data);
                                            print(index);
                                            this.itemIndex = index;
                                            setState(() {
                                              this.txt.text = data;
                                              this.buttonText = 'Update';
                                              _moveCursorToEnd(data.length);
                                            });
                                          },
                                          splashColor: Colors.blueAccent,
                                          child: Container(
                                            child: Text(
                                              data,
                                              style: TextStyle(
                                                fontSize: 20.0,
                                              ),
                                            ),
                                            margin: EdgeInsets.all(10.0),
                                          ),
                                        ),
                                        Container(
                                          child: FlatButton(
                                            child: Text('Delete'),
                                            onPressed: () {
                                              this.itemIndex = index;
                                              setState(() {
                                                print('item is at');
                                                print(this.itemIndex);
                                                this._deleteItem(
                                                    this.itemIndex);
                                              });
                                            },
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                      ],
                                    )),
                              )
                              .values
                              .toList()),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
