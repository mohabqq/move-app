import 'package:equatable/equatable.dart';

abstract class MoviesEvents extends Equatable {
  const MoviesEvents();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetNowPlayingMovieEvent extends MoviesEvents {}

class GetPopularMovieEvent extends MoviesEvents {}

class GetTopRatedMovieEvent extends MoviesEvents {}
