import 'package:movies_appp/features/movies/domine/entity/movies_entity.dart';
import 'package:movies_appp/features/movies/domine/repositery/movies_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_appp/core/error_handeld/failure.dart';

class GetMoviesNowPlyingUseCase {
  final MovieRepository movieRepository;

  GetMoviesNowPlyingUseCase(this.movieRepository);

  Future<Either<Failure ,List<MovieEntity>  >>  execute() async {
    return await movieRepository.getNowPlyingMovies();
  }
}
