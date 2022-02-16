import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_line/core/models/result_model.dart';
import 'package:movie_line/core/state/repositories/trending_repo.dart';

final trendingRepoProvider = Provider((ref) => TrendingNotifier(ref.read));

final trendingListProvider =
    FutureProvider.autoDispose<List<Result>>((ref) async {
  final repo = ref.watch(trendingRepoProvider);
  final response = repo.getTrendingMovies();
  ref.maintainState = true;

  return response;
});
