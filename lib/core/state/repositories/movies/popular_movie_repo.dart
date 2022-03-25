import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_line/core/config/app_config.dart';
import 'package:movie_line/core/models/result_model.dart';

class PopularMoviesState {
  bool loading;
  List<Result> movies = [];
  PopularMoviesState({this.loading = false, required this.movies});
}

class PopularMoviesRepo extends StateNotifier<PopularMoviesState> {
  final Reader _read;
  PopularMoviesRepo(this._read) : super(PopularMoviesState(movies: []));

  final Dio client = Dio();
  Future<List<Result>> getPopularMovies({CancelToken? cancelToken}) async {
    try {
      state = PopularMoviesState(movies: [], loading: true);
      final response = await client.get(AppConfig.TMDB_URL + 'movie/popular',
          queryParameters: {'api_key': AppConfig.TMDB_APIKEY},
          cancelToken: cancelToken);

      final dynamic data = response.data['results'] as List;

      final movies = List<Result>.from(data.map((json) {
        final movie = Result.fromJson(json);
        return movie;
      }));

      state = PopularMoviesState(loading: false, movies: movies);
    } on DioError catch (e) {
    } catch (e) {}

    return state.movies;
  }
}
