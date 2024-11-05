import 'package:dio/dio.dart';
import 'package:movies_appp/core/constant/remote_api.dart';
import 'package:movies_appp/core/error_handeld/api_error_model.dart';
import 'package:movies_appp/core/error_handeld/service_exception.dart';
import 'package:movies_appp/features/movies/data/models/movies_model.dart';

abstract class RemoteDataSource {
  Future<List<MovieModel>>
      getMoviesDataNowPlaying(); // Change to List<MovieModel>
  Future<List<MovieModel>> getPopularNowPlaying(); // Change to List<MovieModel>
  Future<List<MovieModel>>
      getTopRatedNowPlaying(); // Change to List<MovieModel>
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<List<MovieModel>> getMoviesDataNowPlaying() async {
    try {
      final response = await Dio().get(
          '${AppConstant.baseUrl}${AppConstant.nowPlayingEndPoint}?api_key=${AppConstant.apiKey}');

      if (response.statusCode == 200) {
        return List<MovieModel>.from((response.data["results"] as List)
            .map((e) => MovieModel.fromJson(e)));
      } else {
        throw ServiceException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }

  @override
  Future<List<MovieModel>> getPopularNowPlaying() async {
    try {
      final response = await Dio().get(
          '${AppConstant.baseUrl}${AppConstant.popularEndPoint}?api_key=${AppConstant.apiKey}');
      if (response.statusCode == 200) {
        return List<MovieModel>.from((response.data["results"] as List)
            .map((e) => MovieModel.fromJson(e)));
      } else {
        throw ServiceException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedNowPlaying() async {
    try {
      final response = await Dio().get(
          '${AppConstant.baseUrl}${AppConstant.topRatedEndPoint}?api_key=${AppConstant.apiKey}');
      if (response.statusCode == 200) {
        return List<MovieModel>.from((response.data["results"] as List)
            .map((e) => MovieModel.fromJson(e)));
      } else {
        throw ServiceException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }
}
