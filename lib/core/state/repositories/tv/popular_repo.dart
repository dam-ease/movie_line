import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_line/core/config/app_config.dart';
import 'package:movie_line/core/models/result_model.dart';

class PopularState {
  bool loading;
  List<Result> tvShows = [];
  PopularState({this.loading = false, required this.tvShows});
}

class PopularRepo extends StateNotifier<PopularState> {
  final Reader _read;
  PopularRepo(this._read) : super(PopularState(tvShows: []));

  final Dio client = Dio();

  Future<List<Result>> getPopularTvShows({CancelToken? cancelToken}) async {
    try {
      state = PopularState(tvShows: [], loading: true);
      final response = await client.get(AppConfig.TMDB_URL + 'tv/popular',
          queryParameters: {'api_key': AppConfig.TMDB_APIKEY},
          cancelToken: cancelToken);

      final dynamic data = response.data['results'] as List;

      final tvShows = List<Result>.from(data.map((json) {
        final tvShow = Result.fromJson(json);
        return tvShow;
      }));

      state = PopularState(loading: false, tvShows: tvShows);
    } on DioError catch (e) {
    } catch (e) {}

    return state.tvShows;
  }
}
