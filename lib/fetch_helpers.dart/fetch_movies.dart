import 'dart:async';
import 'dart:io';
import 'dart:convert';
import './../api/api_urls.dart';
import 'package:http/http.dart' as http;
import './../models/movie_model.dart';

Future<List<Movie>> fetchMovies(String Keyword) async {
  var client = new http.Client();
  try {
    String url = api_url + Keyword;
    print('url made');
    print(url);
    var response = await client.get(url);
    String data = response.body;
    print(data);
    Map movieData = json.decode(data);
    print(movieData);
    if (movieData['results'] != null) {
      List<Movie> movieResults = [];
      for (var movie in movieData['results']) {
        movieResults.add(Movie.fromJson(movie));
      }
      return movieResults;
    } else {
      return null;
    }
  } catch (e) {
    print(e);
    return null;
  }
}
