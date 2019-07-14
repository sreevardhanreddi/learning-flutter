class MovieCast {
  String character, name, profilePath;

  MovieCast({this.character, this.name, this.profilePath});

  MovieCast.fromJson(Map jsonData) {
    character = jsonData['character'];
    name = jsonData['name'];
    profilePath = jsonData['profile_path'];
  }
}

// {
//         "cast_id": 4,
//         "character": "The Narrator",
//         "credit_id": "52fe4250c3a36847f80149f3",
//         "gender": 2,
//         "id": 819,
//         "name": "Edward Norton",
//         "order": 0,
//         "profile_path": "/eIkFHNlfretLS1spAcIoihKUS62.jpg"
//       },
