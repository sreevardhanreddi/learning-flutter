import 'package:flutter/material.dart';
import './../models/movie_model.dart';
import './../db_helpers/db_class.dart';
import './future_builder_icon_star.dart';

class MovieItem extends StatefulWidget {
  // TODO send a method from parent to this widget to favourite movies

  Movie _movie;
  MovieItem(data) {
    _movie = data;
  }

  @override
  _MovieItemState createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  _toggleFavourite(Movie data) async {
    // TODO: logic check if it exists in db and then toggle
    // bool isFavourite = await _isFavourite(data.id);
    // print('togggggle favourite check -----------');
    // print(isFavourite);
    if (await _isFavourite(data.id)) {
      //delete the movie from database;
      print('delete the movie from database ------');
      MoviesDB.delete(data.id);
    } else {
      print('movie item state');
      print(data.toMap());
      var newData = {...data.toMap(), 'isFavourite': 1.toString()};
      MoviesDB.insert(newData);
    }
    // don't do this , this is bad!!!!
    setState(() {});
  }

  Future<bool> _isFavourite(String id) async {
    return await MoviesDB.isFavourite(id);
  }

  @override
  Widget build(BuildContext context) {
    final poster = (widget._movie.posterPath != null)
        ? "http://image.tmdb.org/t/p/w200" + widget._movie.posterPath
        : "https://via.placeholder.com/150/771796";

    // Widget IconToggle = false ? Icon(Icons.star) : Icon(Icons.star_border);

    return Container(
      child: Card(
        child: Row(
          children: <Widget>[
            Container(
              child: Container(
                child: Image.network(
                  poster,
                  fit: BoxFit.fill,
                  height: 200.0,
                  width: 150.0,
                ),
              ),
            ),
            Container(
              child: Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: Text(
                        widget._movie.title,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: Text(
                        widget._movie.voteAverage.toString(),
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Expanded(
                child: IconButton(
                  // TODO: ADD LOGIC HERE FOR FAVOURITES
                  icon: FutureIconStar(movieId: widget._movie.id),
                  onPressed: () {
                    _toggleFavourite(widget._movie);
                  },
                ),
              ),
            ),
            // FutureIconStar(movieId: widget._movie.id),
          ],
        ),
      ),
    );
  }
}
