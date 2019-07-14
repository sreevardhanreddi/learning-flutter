import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_cast_model.dart';

class CastItem extends StatelessWidget {
  MovieCast movieCast;
  CastItem({this.movieCast});

  @override
  Widget build(BuildContext context) {
    final poster = (movieCast.profilePath != null)
        ? "http://image.tmdb.org/t/p/w200" + movieCast.profilePath
        : "https://via.placeholder.com/150/771796";

    return Container(
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              child: Expanded(
                child: Image.network(poster),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text(movieCast.character),
                  Text('as'),
                  Text(movieCast.name),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
