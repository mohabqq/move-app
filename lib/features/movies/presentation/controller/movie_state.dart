import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_appp/core/error_handeld/failure.dart';
import 'package:movies_appp/features/movies/domine/entity/movies_entity.dart';

enum MovieStates { loading, error, success }

class MoviesStates extends Equatable {
  final MovieStates status;
  final Failure? failure;
  final List<MovieEntity>? movie;

  const MoviesStates({
    this.status = MovieStates.loading,
    this.failure,
    this.movie,
  });

  MoviesStates copyWith({
    MovieStates? status,
    Failure? failure,
    List<MovieEntity>? movie,
  }) {
    return MoviesStates(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      movie: movie ?? this.movie,
    );
  }

  @override
  List<Object?> get props => [status, failure, movie];
}
