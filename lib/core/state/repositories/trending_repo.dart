import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_line/core/config/app_config.dart';
import 'package:movie_line/core/models/result_model.dart';
import 'package:movie_line/core/models/trending_model.dart';

class TrendingState {
  bool loading;
  TrendingState({this.loading = false});
}

class TrendingNotifier extends StateNotifier<TrendingState> {
  final Reader _read;
  TrendingNotifier(this._read) : super(TrendingState());

  final Dio client = Dio();
  Future<List<Result>> getTrendingMovies({CancelToken? cancelToken}) async {
    final response = await client.get(AppConfig.TMDB_URL + 'trending/all/day',
        queryParameters: {'api_key': AppConfig.TMDB_APIKEY},
        cancelToken: cancelToken);

    final List<dynamic> data = response.data['results'] as List;
    // print(data);
    final trendingMovies = List<Result>.from(data.map((json) {
      final trendingMovie = Result.fromJson(json);

      return trendingMovie;
    }));

    return trendingMovies;
  }
}
