import 'package:dartz/dartz.dart';
import 'package:movies_appp/core/error_handeld/failure.dart';
import 'package:movies_appp/features/movies/domine/entity/movies_entity.dart';
import 'package:movies_appp/features/movies/domine/repositery/movies_repo.dart';

class GetMoviesTopRatedUseCase {
  final MovieRepository movieRepository;

  GetMoviesTopRatedUseCase(this.movieRepository);

  Future<Either<Failure ,List<MovieEntity>  >>  execute() async {
    return await movieRepository.getTopRatedMovies();
  }
}
