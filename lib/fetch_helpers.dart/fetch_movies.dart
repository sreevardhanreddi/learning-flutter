import 'dart:async';
import 'dart:io';
import 'dart:convert';
import './../api/api_urls.dart';
import 'package:http/http.dart' as http;
import './../models/movie_model.dart';

Future<List> fetchMovies(String Keyword) async {
  var client = new http.Client();
  try {
    String url = api_url + Keyword;
    var response = await client.get(url);
    String data = response.body;
    Map movieData = json.decode(data);
    print('movie data from response');
    print(movieData);
    print('number of pages');
    print(movieData['total_pages']);
    if (movieData['results'] != null) {
      List<Movie> movieResults = [];
      for (var movie in movieData['results']) {
        movieResults.add(Movie.fromJson(movie));
      }
      return [
        movieResults,
        movieData['total_pages'],
        movieData['total_results'],
      ];
    } else {
      return null;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<List> fetchNexPageMovies(String Keyword, int pageNumber) async {
  var client = new http.Client();
  try {
    String url = api_url + Keyword + '&page=${pageNumber}';
    print('url made in fetchNexPageMovies');
    print(url);
    var response = await client.get(url);
    String data = response.body;
    Map movieData = json.decode(data);
    print('movie data from response');
    print(movieData);
    print('number of pages');
    print(movieData['total_pages']);
    if (movieData['results'] != null) {
      List<Movie> movieResults = [];
      for (var movie in movieData['results']) {
        movieResults.add(Movie.fromJson(movie));
      }
      return [movieResults, movieData['total_pages']];
    } else {
      return null;
    }
  } catch (e) {
    print(e);
    return null;
  }
}
