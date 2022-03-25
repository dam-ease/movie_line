import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_line/core/config/app_config.dart';
import 'package:movie_line/core/models/result_model.dart';

class TopRatedMoviesState {
  bool loading;
  List<Result> movies = [];
  TopRatedMoviesState({this.loading = false, required this.movies});
}

class TopRatedMoviesRepo extends StateNotifier<TopRatedMoviesState> {
  final Reader _read;
  TopRatedMoviesRepo(this._read) : super(TopRatedMoviesState(movies: []));

  final Dio client = Dio();
  Future<List<Result>> getTopRatedMovies({CancelToken? cancelToken}) async {
    try {
      state = TopRatedMoviesState(movies: [], loading: true);
      final response = await client.get(AppConfig.TMDB_URL + 'movie/top_rated',
          queryParameters: {'api_key': AppConfig.TMDB_APIKEY},
          cancelToken: cancelToken);

      final dynamic data = response.data['results'] as List;

      final movies = List<Result>.from(data.map((json) {
        final movie = Result.fromJson(json);
        return movie;
      }));

      state = TopRatedMoviesState(loading: false, movies: movies);
    } on DioError catch (e) {
    } catch (e) {}

    return state.movies;
  }
}
