import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_appp/features/movies/domine/usecase/get_movies_now_plying_use_case.dart';
import 'package:movies_appp/features/movies/presentation/controller/event.dart';
import 'package:movies_appp/features/movies/presentation/controller/state.dart';

class MovieBloc extends Bloc<MoviesEvents, MovieState> {
  final GetMoviesNowPlyingUseCase getMoviesNowPlyingUseCase;

  MovieBloc(this.getMoviesNowPlyingUseCase) : super(const MovieState()) {
    on<GetNowPlayingMovieEvent>((event, emit) async {
      final result = await getMoviesNowPlyingUseCase.execute();
      result.fold(
          (failure) => emit(MovieState(
                nowPlyingMessage: failure.errMessage,
                requestState: RequestState.error,
              )),
          (success) => emit(MovieState(
                nowPlayingMovie: success,
                requestState: RequestState.success,
              )));
    });
  }
}
