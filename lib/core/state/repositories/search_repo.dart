import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_line/core/config/app_config.dart';
import 'package:movie_line/core/models/result_model.dart';

class SearchState {
  bool loading;
  List<Result> result = [];
  SearchState({this.loading = false, required this.result});
}

class SearchRepo extends StateNotifier<SearchState> {
  final Reader _read;
  SearchRepo(this._read) : super(SearchState(result: []));

  final Dio client = Dio();

  Future<bool> search(String query, {CancelToken? cancelToken}) async {
    Response? response;
    try {
      state = SearchState(result: [], loading: true);
      response = await client.get(AppConfig.TMDB_URL + 'search/multi',
          queryParameters: {'api_key': AppConfig.TMDB_APIKEY, 'query': query},
          cancelToken: cancelToken);
      final List<dynamic> data = response.data['results'] ?? [];

      final tvShows = List<Result>.from(data.map((json) {
        final tvShow = Result.fromJson(json);
        return tvShow;
      }));

      state = SearchState(loading: false, result: tvShows);
    } on DioError catch (e) {
    } catch (e) {}

    return response?.statusCode == 200;
  }
}
