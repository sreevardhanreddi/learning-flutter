import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_cast_model.dart';
import './../models/movie_model.dart';
import './../fetch_helpers.dart/fetch_movie_cast.dart';
import './../widgets/overview.dart';
import './../widgets/horizontal_list_cast.dart';

class MovieDetail extends StatefulWidget {
  // MovieDetail({Key key}) : super(key: key);

  Movie moviedata;

  MovieDetail({this.moviedata});

  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  List<MovieCast> movieCast = [];
  bool isFetchingCast = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      isFetchingCast = true;
    });
    fetchMovieCast(widget.moviedata.id).then((data) {
      setState(() {
        movieCast = data;
        isFetchingCast = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Movie movie = widget.moviedata;
    Widget castListWidget = (!isFetchingCast)
        ? MovieCastList(movieCast: movieCast)
        : CircularProgressIndicator();
    // todo learn or refactor this with SingleChildScrollView
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(movie.title), // splice it if it's too long
        ),
        body: ListView(
          children: <Widget>[
            // child:
            Column(
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Overview(
                  movie: movie,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: EdgeInsets.all(4.0),
                  child: Container(
                    child: Text(
                      movie.overview,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  height: 200.0,
                  child: Center(
                    child: castListWidget,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
