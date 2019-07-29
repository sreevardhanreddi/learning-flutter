import 'package:flutter/material.dart';
import 'widgets/app.dart';
import './screens/favourites_screen.dart';
import 'widgets/side_drawer.dart';
import './screens/movie_detail.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Movie App'),
        ),
        body: Container(
          child: MovieApp(),
        ),
        drawer: SideDrawer(),
      ),
      routes: {
        '/favourites': (ctx) => FavouritesList(),
        '/details': (ctx) => MovieDetail(),
      },
    );
  }
}
