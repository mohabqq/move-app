import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_appp/features/movies/domine/usecase/get_movies_now_plying_use_case.dart';
import 'package:movies_appp/features/movies/domine/usecase/get_movies_popular_use_case.dart';
import 'package:movies_appp/features/movies/domine/usecase/get_movies_top_rated_use_case.dart';
import 'package:movies_appp/features/movies/presentation/controller/movie_state.dart';

class MovieCubit extends Cubit<MoviesStates> {
  final GetMoviesNowPlyingUseCase getMoviesNowPlyingUseCase;

  final GetMoviesPopularUseCase getMoviesPopularUseCase;

  final GetMoviesTopRatedUseCase getMoviesTopRatedUseCase;

  MovieCubit(
    this.getMoviesNowPlyingUseCase,
    this.getMoviesPopularUseCase,
    this.getMoviesTopRatedUseCase,
  ) : super(MoviesStates());

  Future<void> getNowPlyingMovie() async {
    emit(state.copyWith(status: MovieStates.loading));

    final response = await getMoviesNowPlyingUseCase.execute();

    response.fold(
          (failure) {
        // Handling failure (Left)
        emit(state.copyWith(status: MovieStates.error, failure: failure));
      },
          (moviesList) {
        // Handling success (Right)
        emit(state.copyWith(movie: moviesList, status: MovieStates.success));
      },
    );
  }
  Future<void> getPopularMovie() async {
    emit(state.copyWith(status: MovieStates.loading));

    final response = await getMoviesPopularUseCase.execute();

    response.fold(
          (failure) {
        // Handling failure (Left)
        emit(state.copyWith(status: MovieStates.error, failure: failure));
      },
          (moviesList) {
        // Handling success (Right)
        emit(state.copyWith(movie: moviesList, status: MovieStates.success));
      },
    );
  }

  Future<void> getTopRatedMovie() async {
    emit(state.copyWith(status: MovieStates.loading));

    final response = await getMoviesTopRatedUseCase.execute();

    response.fold(
          (failure) {
        // Handling failure (Left)
        emit(state.copyWith(status: MovieStates.error, failure: failure));
      },
          (moviesList) {
        // Handling success (Right)
        emit(state.copyWith(movie: moviesList, status: MovieStates.success));
      },
    );
  }

}
