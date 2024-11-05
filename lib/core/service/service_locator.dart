import 'package:get_it/get_it.dart';
import 'package:movies_appp/features/movies/data/data_source/remote_data_source.dart';
import 'package:movies_appp/features/movies/data/repositery/get_movies_data_repositery_now_plying.dart';
import 'package:movies_appp/features/movies/domine/repositery/movies_repo.dart';
import 'package:movies_appp/features/movies/domine/usecase/get_movies_now_plying_use_case.dart';
import 'package:movies_appp/features/movies/domine/usecase/get_movies_popular_use_case.dart';
import 'package:movies_appp/features/movies/domine/usecase/get_movies_top_rated_use_case.dart';
import 'package:movies_appp/features/movies/presentation/controller/movie_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    /// Remote Data Source
    sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());

    /// Repository
    sl.registerLazySingleton<MovieRepository>(() => RepositoryImpl(sl()));

    /// Use Cases
    sl.registerLazySingleton<GetMoviesNowPlyingUseCase>(
            () => GetMoviesNowPlyingUseCase(sl()));
    sl.registerLazySingleton<GetMoviesPopularUseCase>(
            () => GetMoviesPopularUseCase(sl()));
    sl.registerLazySingleton<GetMoviesTopRatedUseCase>(
            () => GetMoviesTopRatedUseCase(sl()));

    /// Cubit
    sl.registerFactory<MovieCubit>(() => MovieCubit(
      sl(), // GetMoviesNowPlyingUseCase
      sl(), // GetMoviesPopularUseCase
      sl(), // GetMoviesTopRatedUseCase
    ));
  }
}
