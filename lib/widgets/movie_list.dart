import 'package:flutter/material.dart';
import './../models/movie_model.dart';
import './movie_item.dart';
import './../screens/movie_detail.dart';

class MovieList extends StatefulWidget {
  // MovieList({Key key}) : super(key: key);

  List<Movie> data = [];
  bool isLoading = false;
  MovieList(data, isLoading) {
    print('MovieList constructor');
    print(data);
    this.isLoading = isLoading;
    this.data = data;
  }
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List<Movie> _data = [];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   print('inside init state');
  //   print(widget.data);
  //   super.initState();
  //   _data = widget.data;
  // }

  @override
  Widget build(BuildContext context) {
    _data = widget.data;
    bool isloading = widget.isLoading;
    print('in movie list data ----------------');
    print(_data);
    print(isloading);
    if (isloading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Container(
        child: Container(
          child: ListView.builder(
              itemCount: _data.length,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  child: Container(
                    child: MovieItem(_data[index]),
                  ),
                  onTap: () {
                    print('tapped');
                    print(_data[index].id);
                    print(_data[index].title);
                    print(_data[index].overview);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MovieDetail(moviedata: _data[index])),
                    );
                  },
                );
              }),
        ),
      );
    }
  }
}
