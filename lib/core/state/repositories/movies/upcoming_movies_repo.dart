import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_line/core/config/app_config.dart';
import 'package:movie_line/core/models/result_model.dart';

class UpcomingMoviesState {
  bool loading;
  List<Result> movies = [];
  UpcomingMoviesState({this.loading = false, required this.movies});
}

class UpcomingMoviesRepo extends StateNotifier<UpcomingMoviesState> {
  final Reader _read;
  UpcomingMoviesRepo(this._read) : super(UpcomingMoviesState(movies: []));

  final Dio client = Dio();

  Future<List<Result>> getUpcomingMovies({CancelToken? cancelToken}) async {
    try {
      state = UpcomingMoviesState(movies: [], loading: true);
      final response = await client.get(AppConfig.TMDB_URL + 'movie/upcoming',
          queryParameters: {'api_key': AppConfig.TMDB_APIKEY},
          cancelToken: cancelToken);

      final dynamic data = response.data['results'] as List;

      final movies = List<Result>.from(data.map((json) {
        final movie = Result.fromJson(json);
        return movie;
      }));

      state = UpcomingMoviesState(loading: false, movies: movies);
    } on DioError catch (e) {
    } catch (e) {}

    return state.movies;
  }
}
