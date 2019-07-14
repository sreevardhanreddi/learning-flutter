import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';

class Overview extends StatelessWidget {
  // const name({Key key}) : super(key: key);
  Movie movie;
  Overview({this.movie});

  @override
  Widget build(BuildContext context) {
    final poster = (movie.posterPath != null)
        ? "http://image.tmdb.org/t/p/w200" + movie.posterPath
        : "https://via.placeholder.com/150/771796";
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5.0),
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
                      movie.title,
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
                      movie.voteAverage.toString(),
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
        ],
      ),
    );
  }
}
