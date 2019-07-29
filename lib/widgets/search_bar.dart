import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  // SearchBar({Key key}) : super(key: key);

  Function sendMovieQuery;

  SearchBar(Function funcFromParent) {
    this.sendMovieQuery = funcFromParent;
  }

  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Container(
            child: Expanded(
              child: TextField(
                onSubmitted: (data) {
                  if (data.length > 0) {
                    widget.sendMovieQuery(data);
                  }
                },
                onChanged: (data) {
                  setState(() {
                    _query = data;
                  });
                },
                decoration: InputDecoration(hintText: 'Search Movies'),
              ),
            ),
          ),
          Container(
            child: Container(
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  if (_query.length > 0) {
                    widget.sendMovieQuery(_query);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
