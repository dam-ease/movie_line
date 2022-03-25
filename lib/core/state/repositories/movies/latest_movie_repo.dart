import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_line/core/config/app_config.dart';
import 'package:movie_line/core/models/movie.dart';
import 'package:movie_line/core/models/result_model.dart';

class LatestMovieState {
  bool loading;
  Result movies = Result();
  LatestMovieState({this.loading = false, required this.movies});
}

class LatestMovieRepo extends StateNotifier<LatestMovieState> {
  final Reader _read;
  LatestMovieRepo(this._read) : super(LatestMovieState(movies: Result()));

  final Dio client = Dio();

  Future<Result> getLatestMovies({CancelToken? cancelToken}) async {
    try {
      state = LatestMovieState(movies: Result(), loading: true);
      final response = await client.get(AppConfig.TMDB_URL + 'movie/latest',
          queryParameters: {'api_key': AppConfig.TMDB_APIKEY},
          cancelToken: cancelToken);
      final dynamic data = response.data as Map<String, dynamic>;
      print(data);
      final movies = Result.fromJson(data);
      state = LatestMovieState(loading: false, movies: movies);
    } on DioError catch (e) {
    } catch (e) {}

    return state.movies;
  }
}
