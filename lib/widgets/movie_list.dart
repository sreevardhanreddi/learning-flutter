import 'package:flutter/material.dart';
import './../models/movie_model.dart';
import './movie_item.dart';
import './../screens/movie_detail.dart';
import 'package:flushbar/flushbar.dart';

class MovieList extends StatefulWidget {
  // MovieList({Key key}) : super(key: key);

  List<Movie> data = [];
  bool isLoading = false;
  Function getNextPageFromParent;
  bool isFooterLoading = false;
  bool noMoreResults = false;
  MovieList(data, isLoading, getNextPage, isFooterLoading, noMoreResults) {
    this.isLoading = isLoading;
    this.data = data;
    this.getNextPageFromParent = getNextPage;
    this.isFooterLoading = isFooterLoading;
    this.noMoreResults = noMoreResults;
  }
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List<Movie> _data = [];
  ScrollController _scrollController = new ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !widget.noMoreResults) {
        // noMoreResults is added because scrolling to the bottom should not send any requests to api
        print('!!!!!!!!!!!!!!!!!!!!!!!!!!');
        print('reached the end of list, you need to fetch more items');
        print('!!!!!!!!!!!!!!!!!!!!!!!!!!');
        widget.getNextPageFromParent();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _data = widget.data;
    bool isloading = widget.isLoading;

    Widget FooterWidget = (widget.isFooterLoading
        ? CircularProgressIndicator()
        : Container(
            child: Text('reached end'),
          ));

    Widget NoResultsSnackBar = (widget.noMoreResults
        ? showInfoFlushbar(context)
        : Container(
            child: Text('No more data'),
          ));

    if (isloading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _data.length,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      child: Container(
                        child: MovieItem(_data[index]),
                      ),
                      onTap: () {
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
            FooterWidget,
            NoResultsSnackBar,
          ],
        ),
      );
    }
  }
}

showInfoFlushbar(BuildContext context) {
  Flushbar(
    title: 'This action is prohibited',
    message: 'Lorem ipsum dolor sit amet',
    icon: Icon(
      Icons.info_outline,
      size: 28,
      color: Colors.blue.shade300,
    ),
    leftBarIndicatorColor: Colors.blue.shade300,
    duration: Duration(seconds: 3),
  )..show(context);
}
