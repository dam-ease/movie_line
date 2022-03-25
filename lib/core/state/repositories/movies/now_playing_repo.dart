import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_line/core/config/app_config.dart';
import 'package:movie_line/core/models/result_model.dart';

class NowPlayingMoviesState {
  bool loading;
  List<Result> movies = [];
  NowPlayingMoviesState({this.loading = false, required this.movies});
}

class NowPlayingMoviesRepo extends StateNotifier<NowPlayingMoviesState> {
  final Reader _read;
  NowPlayingMoviesRepo(this._read) : super(NowPlayingMoviesState(movies: []));

  final Dio client = Dio();

  Future<List<Result>> getNowPlayingMovies({CancelToken? cancelToken}) async {
    try {
      state = NowPlayingMoviesState(movies: [], loading: true);
      final response = await client.get(
          AppConfig.TMDB_URL + 'movie/now_playing',
          queryParameters: {'api_key': AppConfig.TMDB_APIKEY},
          cancelToken: cancelToken);

      final dynamic data = response.data['results'] as List;

      final movies = List<Result>.from(data.map((json) {
        final movie = Result.fromJson(json);
        return movie;
      }));

      state = NowPlayingMoviesState(loading: false, movies: movies);
    } on DioError catch (e) {
    } catch (e) {}

    return state.movies;
  }
}
