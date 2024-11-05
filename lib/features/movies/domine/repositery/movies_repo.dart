  import 'package:dartz/dartz.dart';
import 'package:movies_appp/core/error_handeld/failure.dart';
import 'package:movies_appp/features/movies/domine/entity/movies_entity.dart';

abstract class MovieRepository {
  Future<Either<Failure ,List<MovieEntity>  >> getNowPlyingMovies();
  Future<Either<Failure ,List<MovieEntity>  >>  getPopularMovies();
  Future<Either<Failure ,List<MovieEntity>  >> getTopRatedMovies();
}