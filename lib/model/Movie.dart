class Movie{
  String backdrop_path;
  int id;
  String original_language;
  String original_title;
  String overview;
  num popularity;
  String poster_path;
  String release_date;
  String title;
  double vote_average;
  int vote_count;

  Movie({
    required this.backdrop_path,
    required this.id,
    required this.original_language,
    required this.original_title,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.release_date,
    required this.title,
    required this.vote_average,
    required this.vote_count,
  });

  Map<String, dynamic> toMap() {
    return {
      'backdrop_path': this.backdrop_path,
      'id': this.id,
      'original_language': this.original_language,
      'original_title': this.original_title,
      'overview': this.overview,
      'popularity': this.popularity,
      'poster_path': this.poster_path,
      'release_date': this.release_date,
      'title': this.title,
      'vote_average': this.vote_average,
      'vote_count': this.vote_count,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      backdrop_path: map['backdrop_path'] as String,
      id: map['id'] as int,
      original_language: map['original_language'] as String,
      original_title: map['original_title'] as String,
      overview: map['overview'] as String,
      popularity: map['popularity'] as num,
      poster_path: map['poster_path'] as String,
      release_date: map['release_date'] as String,
      title: map['title'] as String,
      vote_average: map['vote_average'] as double,
      vote_count: map['vote_count'] as int,
    );
  }
}