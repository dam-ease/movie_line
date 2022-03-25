import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_line/core/config/app_config.dart';
import 'package:movie_line/core/models/result_model.dart';

class OnTheAirState {
  bool loading;
  List<Result> tvShows = [];
  OnTheAirState({this.loading = false, required this.tvShows});
}

class OnTheAirRepo extends StateNotifier<OnTheAirState> {
  final Reader _read;
  OnTheAirRepo(this._read) : super(OnTheAirState(tvShows: []));

  final Dio client = Dio();

  Future<List<Result>> getOnAirTvShows({CancelToken? cancelToken}) async {
    try {
      state = OnTheAirState(tvShows: [], loading: true);
      final response = await client.get(AppConfig.TMDB_URL + 'tv/on_the_air',
          queryParameters: {'api_key': AppConfig.TMDB_APIKEY},
          cancelToken: cancelToken);

      final dynamic data = response.data['results'] as List;

      final tvShows = List<Result>.from(data.map((json) {
        final tvShow = Result.fromJson(json);
        return tvShow;
      }));

      state = OnTheAirState(loading: false, tvShows: tvShows);
    } on DioError catch (e) {
    } catch (e) {}

    return state.tvShows;
  }
}
