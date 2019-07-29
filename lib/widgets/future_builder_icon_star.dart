import 'package:flutter/material.dart';
import './../db_helpers/db_class.dart';
import './../models/movie_model.dart';

class FutureIconStar extends StatefulWidget {
  // FutureIconStar({Key key}) : super(key: key);

  String movieId;

  FutureIconStar({this.movieId});

  FutureIconStarState createState() => FutureIconStarState();
}

class FutureIconStarState extends State<FutureIconStar> {
  Future<bool> _isFavourite(String id) async {
    return await MoviesDB.isFavourite(id);
  }

  @override
  Widget build(BuildContext context) {
    print('rebuilding icon *************');
    return FutureBuilder(
      future: _isFavourite(widget.movieId),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
          if (snapshot.data == true) {
            return Icon(Icons.star);
          } else {
            return Icon(Icons.star_border);
          }
          return Text(snapshot.data.toString());
        } else {
          return Text('no data');
          // throw 'no data for icon';
        }
      },
    );
  }
}
