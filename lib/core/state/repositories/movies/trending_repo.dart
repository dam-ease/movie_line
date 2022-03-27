import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_line/core/config/app_config.dart';
import 'package:movie_line/core/models/result_model.dart';

class TrendingState {
  bool loading;
  List<Result> movies = [];
  TrendingState({this.loading = false, required this.movies});
}

class TrendingRepo extends StateNotifier<TrendingState> {
  // final Reader _read;
  TrendingRepo() : super(TrendingState(movies: []));

  final Dio client = Dio();

  Future<List<Result>> getTrendingMovies({CancelToken? cancelToken}) async {
    try {
      state = TrendingState(movies: [], loading: true);
      final response = await client.get(AppConfig.TMDB_URL + 'trending/all/day',
          queryParameters: {'api_key': AppConfig.TMDB_APIKEY},
          cancelToken: cancelToken);

      final dynamic data = response.data['results'] as List;

      final movies = List<Result>.from(data.map((json) {
        final movie = Result.fromJson(json);
        return movie;
      }));

      state = TrendingState(loading: false, movies: movies);
    } on DioError catch (e) {
    } catch (e) {}

    return state.movies;
  }
}
