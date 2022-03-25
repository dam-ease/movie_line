import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_line/core/config/app_config.dart';
import 'package:movie_line/core/models/result_model.dart';

class TopRatedState {
  bool loading;
  List<Result> tvShows = [];
  TopRatedState({this.loading = false, required this.tvShows});
}

class TopRatedRepo extends StateNotifier<TopRatedState> {
  final Reader _read;
  TopRatedRepo(this._read) : super(TopRatedState(tvShows: []));

  final Dio client = Dio();

  Future<List<Result>> getTopRatedTvShows({CancelToken? cancelToken}) async {
    try {
      state = TopRatedState(tvShows: [], loading: true);
      final response = await client.get(AppConfig.TMDB_URL + 'tv/top_rated',
          queryParameters: {'api_key': AppConfig.TMDB_APIKEY},
          cancelToken: cancelToken);

      final dynamic data = response.data['results'] as List;

      final tvShows = List<Result>.from(data.map((json) {
        final tvShow = Result.fromJson(json);
        return tvShow;
      }));

      state = TopRatedState(loading: false, tvShows: tvShows);
    } on DioError catch (e) {
    } catch (e) {}

    return state.tvShows;
  }
}
