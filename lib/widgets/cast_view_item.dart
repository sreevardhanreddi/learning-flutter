import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movies_app/models/movie_cast_model.dart';

class CastItem extends StatelessWidget {
  MovieCast movieCast;
  CastItem({this.movieCast});

  @override
  Widget build(BuildContext context) {
    final poster = (movieCast.profilePath != null)
        ? "http://image.tmdb.org/t/p/w200" + movieCast.profilePath
        : "https://via.placeholder.com/150/771796";
    double c_width = MediaQuery.of(context).size.width * 0.3;

    return Column(
      children: <Widget>[
        Container(
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  child: Image.network(
                    poster,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: c_width,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(movieCast.name),
                        Text('as'),
                        Text(movieCast.character),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
