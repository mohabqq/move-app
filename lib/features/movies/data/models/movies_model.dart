import 'package:movies_appp/features/movies/domine/entity/movies_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.overview,
    required super.title,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      id: json['id'],
      overview: json['overview'],
      title: json['title'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'],
    );
  }
}
