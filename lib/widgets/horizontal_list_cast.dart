import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_cast_model.dart';
import 'package:movies_app/widgets/cast_view_item.dart';

class MovieCastList extends StatelessWidget {
  // const name({Key key}) : super(key: key);

  List<MovieCast> movieCast = [];
  MovieCastList({this.movieCast});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: movieCast.length,
        itemBuilder: (ctx, index) {
          return Container(
            child: CastItem(
              movieCast: movieCast[index],
            ),
          );
        },
      ),
    );
  }
}
