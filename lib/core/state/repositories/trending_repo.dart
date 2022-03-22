import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_line/core/config/app_config.dart';
import 'package:movie_line/core/models/result_model.dart';

class TrendingState {
  bool loading;
  List<Movies> movies = [];
  TrendingState({this.loading = false, required this.movies});
}

class TrendingRepo extends StateNotifier<TrendingState> {
  final Reader _read;
  TrendingRepo(this._read) : super(TrendingState(movies: []));

  final Dio client = Dio();

  Future<List<Movies>> getTrendingMovies({CancelToken? cancelToken}) async {
    state = TrendingState(movies: [], loading: true);
    final response = await client.get(AppConfig.TMDB_URL + 'trending/all/day',
        queryParameters: {'api_key': AppConfig.TMDB_APIKEY},
        cancelToken: cancelToken);

    final dynamic data = response.data['results'] as List;

    final movies = List<Movies>.from(data.map((json) {
      final movie = Movies.fromJson(json);
      return movie;
    }));

    state = TrendingState(loading: false, movies: movies);

    return movies;
  }
}
