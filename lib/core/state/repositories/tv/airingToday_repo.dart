import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_line/core/config/app_config.dart';
import 'package:movie_line/core/models/result_model.dart';

class AiringTodayState {
  bool loading;
  List<Result> tvShows = [];
  AiringTodayState({this.loading = false, required this.tvShows});
}

class AiringTodayRepo extends StateNotifier<AiringTodayState> {
  final Reader _read;
  AiringTodayRepo(this._read) : super(AiringTodayState(tvShows: []));

  final Dio client = Dio();

  Future<List<Result>> getAiringTodayTvShows({CancelToken? cancelToken}) async {
    try {
      state = AiringTodayState(tvShows: [], loading: true);
      final response = await client.get(AppConfig.TMDB_URL + 'tv/airing_today',
          queryParameters: {'api_key': AppConfig.TMDB_APIKEY},
          cancelToken: cancelToken);

      final dynamic data = response.data['results'] as List;

      final tvShows = List<Result>.from(data.map((json) {
        final tvShow = Result.fromJson(json);
        return tvShow;
      }));

      state = AiringTodayState(loading: false, tvShows: tvShows);
    } on DioError catch (e) {
    } catch (e) {}

    return state.tvShows;
  }
}
