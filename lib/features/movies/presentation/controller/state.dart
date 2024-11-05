import 'package:equatable/equatable.dart';
import 'package:movies_appp/features/movies/domine/entity/movies_entity.dart';

enum RequestState {
  isLoading,
  error,
  success,
}

class MovieState extends Equatable {
  final List<MovieEntity> nowPlayingMovie;
  final RequestState requestState;
  final String nowPlyingMessage;

  const MovieState({
    this.nowPlayingMovie = const [],
    this.requestState = RequestState.isLoading,
    this.nowPlyingMessage = '',
  });

  @override
  List<Object?> get props => [
    nowPlayingMovie,
    requestState,
    nowPlyingMessage,
  ];
}
