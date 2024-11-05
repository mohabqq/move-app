import 'package:dartz/dartz.dart';
import 'package:movies_appp/core/error_handeld/failure.dart';
import 'package:movies_appp/core/error_handeld/service_exception.dart';
import 'package:movies_appp/features/movies/data/data_source/remote_data_source.dart';
import 'package:movies_appp/features/movies/domine/entity/movies_entity.dart';
import 'package:movies_appp/features/movies/domine/repositery/movies_repo.dart';

class RepositoryImpl extends MovieRepository {
  final RemoteDataSource _remoteDataSource;

  RepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlyingMovies() async {
    final result = await _remoteDataSource.getMoviesDataNowPlaying();
    try {
      return Right(result);
    } on ServiceException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    final result = await _remoteDataSource.getPopularNowPlaying();
    try {
      return Right(result);
    } on ServiceException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies() async {
    final result = await _remoteDataSource.getTopRatedNowPlaying();
    try {
      return Right(result);
    } on ServiceException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
