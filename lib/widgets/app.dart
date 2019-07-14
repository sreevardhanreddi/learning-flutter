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
  bool isLoading = false;

  getMovieQuery(String query) {
    setState(() {
      isLoading = true;
    });
    fetchMovies(query).then((data) => {
          setState(() {
            movies = data;
            print(
                'after set state >>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<');
            print(movies);
            isLoading = false;
          })
        });
  }
  //   Movie(
  //     title: 'Fight Club',
  //     posterPath: '/adw6Lq9FiC9zjYEpOqfq03ituwp.jpg',
  //     id: '550',
  //     overview:
  //         'A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.',
  //     voteAverage: 8.4,
  //     isFavourite: false,
  //   ),
  //   Movie(
  //     title: 'some really long movie name lets see',
  //     posterPath: '/adw6Lq9FiC9zjYEpOqfq03ituwp.jpg',
  //     id: '550',
  //     overview:
  //         'A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.',
  //     voteAverage: 8.4,
  //     isFavourite: false,
  //   ),
  //   Movie(
  //     title: 'Fight Club',
  //     posterPath: '/adw6Lq9FiC9zjYEpOqfq03ituwp.jpg',
  //     id: '550',
  //     overview:
  //         'A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.',
  //     voteAverage: 8.4,
  //     isFavourite: false,
  //   ),
  //   Movie(
  //     title: 'Fight Club',
  //     posterPath: '/adw6Lq9FiC9zjYEpOqfq03ituwp.jpg',
  //     id: '550',
  //     overview:
  //         'A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.',
  //     voteAverage: 8.4,
  //     isFavourite: false,
  //   ),
  // ];

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
            child: MovieList(movies, isLoading),
          )
        ],
      ),
    );
  }
}
