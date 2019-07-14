import 'package:flutter/material.dart';
import './../models/movie_model.dart';

class MovieItem extends StatelessWidget {
  // TODO send a method from parent to this widget to favourite movies

  Movie _movie;
  MovieItem(data) {
    _movie = data;
  }

  @override
  Widget build(BuildContext context) {
    final poster = (_movie.posterPath != null)
        ? "http://image.tmdb.org/t/p/w200" + _movie.posterPath
        : "https://via.placeholder.com/150/771796";

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
                        _movie.title,
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
                        _movie.voteAverage.toString(),
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
                  icon: Icon(Icons.star_border),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
