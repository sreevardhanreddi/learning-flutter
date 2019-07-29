class Movie {
  String title, posterPath, id, overview, releaseDate, voteAverage;
  String isFavourite;
  // bool isFavourite;
  // double voteAverage;

  Movie(
      {this.title,
      this.posterPath,
      this.id,
      this.overview,
      this.isFavourite,
      this.voteAverage});

  Movie.fromJson(Map jsonData)
      : title = jsonData['title'],
        posterPath = jsonData['poster_path'],
        id = jsonData['id'].toString(),
        overview = jsonData['overview'],
        voteAverage = jsonData['vote_average'].toString(),
        releaseDate = jsonData['release_date'],
        isFavourite = 0.toString();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'title': title,
      'posterPath': posterPath,
      'id': id,
      'overview': overview,
      'voteAverage': voteAverage,
      'isFavourite': isFavourite,
      'releaseDate': releaseDate,
    };
    return map;
  }
}
