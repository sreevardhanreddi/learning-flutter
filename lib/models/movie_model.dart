class Movie {
  String title, posterPath, id, overview, releaseDate, voteAverage;
  bool isFavourite;
  // double voteAverage;

  Movie(
      {this.title, this.posterPath, this.id, this.overview, this.isFavourite, this.voteAverage});

  Movie.fromJson(Map jsonData)
      : title = jsonData['title'],
        posterPath = jsonData['poster_path'],
        id = jsonData['id'].toString(),
        overview = jsonData['overview'],
        voteAverage = jsonData['vote_average'].toString(),
        isFavourite = false;
}
