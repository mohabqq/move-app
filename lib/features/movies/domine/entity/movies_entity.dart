import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String overview;
  final String title;
  final String releaseDate;
  final double voteAverage;

  const MovieEntity({
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.overview,
    required this.title,
    required this.releaseDate,
    required this.voteAverage,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        backdropPath,
        genreIds,
        id,
        overview,
        title,
        releaseDate,
        voteAverage,
      ];
}
