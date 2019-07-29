import 'package:flutter/material.dart';
import 'package:movies_app/fetch_helpers.dart/fetch_movies.dart';
import './search_bar.dart';
import './app.dart';
import './../models/movie_model.dart';
import './movie_list.dart';

class MovieApp extends StatefulWidget {
  // MovieApp({Key key}) : super(key: key);

  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  List<Movie> movies = [];
  String _query = '';
  bool isLoading = false;
  int totalPages = 0;
  int currentPage = 1;
  int totalResults = 0;
  bool isFooterLoading = false;
  bool noMoreResults = false;

  getMovieQuery(String query) {
    setState(() {
      isLoading = true;
      _query = query;
    });
    fetchMovies(_query).then((data) => {
          setState(() {
            movies = data[0];
            totalPages = data[1];
            isLoading = false;
            totalResults = data[2];
          })
        });
  }

  getNextPage() {
    if (totalPages >= currentPage) {
      var nextPage = currentPage + 1;
      print('fetching next page');
      print(nextPage);
      setState(() {
        currentPage = nextPage;
        isFooterLoading = true;
      });
      fetchNexPageMovies(_query, nextPage).then((data) => {
            setState(() {
              movies = [...movies, ...data[0]];
              totalPages = data[1];
              isFooterLoading = false;
              print('movies length after fetching next page');
              print(movies.length);
            })
          });
    } else {
      setState(() {
        noMoreResults = true;
      });
      // throw 'Page size is exceeded';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SearchBar(getMovieQuery),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: MovieList(
                movies, isLoading, getNextPage, isFooterLoading, noMoreResults),
          )
        ],
      ),
    );
  }
}
