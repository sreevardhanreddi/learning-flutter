import 'package:flutter/material.dart';
import './../models/movie_model.dart';
import './../db_helpers/db_class.dart';

class FavouritesList extends StatefulWidget {
  final routeName = 'favourites';

  FavouritesList({Key key}) : super(key: key);

  _FavouritesListState createState() => _FavouritesListState();
}

class _FavouritesListState extends State<FavouritesList> {
  List<Movie> _movies = [];

  _getFavourites() async {
    final movies = await MoviesDB.getFavouriteMovies();
    print('>>>>>>>>>>>>>. in init state of favorites');
    print(movies);
    setState(() {
      _movies = movies;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getFavourites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('favourites'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _movies.length,
                itemBuilder: (ctx, index) {
                  return Text(_movies[index].title);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
