import 'dart:async';
import 'dart:convert';
import 'dart:io';
import './../api/api_urls.dart';
import 'package:http/http.dart' as http;
import './../models/movie_cast_model.dart';

Future<List<MovieCast>> fetchMovieCast(String id) async {
  var client = new http.Client();
  try {
    var url =
        "https://api.themoviedb.org/3/movie/${id}?api_key=f401dde6214053528ef221fbf9e0529f&append_to_response=credits";
    print('url made for casting');
    print(url);
    var response = await client.get(url);
    String data = response.body;
    Map movieCast = json.decode(data);
    print('movieCast ******************');
    print(movieCast['credits']['cast']);
    List<MovieCast> movieCastData = [];
    for (var cast in movieCast['credits']['cast']) {
      movieCastData.add(MovieCast.fromJson(cast));
    }
    return movieCastData;
  } catch (e) {
    print(e);
    return null;
  }
}
