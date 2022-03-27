import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_line/core/models/result_model.dart';
import 'package:movie_line/core/models/trending_model.dart';
import 'package:movie_line/core/state/repositories/movies/trending_repo.dart';

final trendingRepoProvider =
    StateNotifierProvider<TrendingRepo, TrendingState>((ref) => TrendingRepo());

final trendingProvider = StateProvider<List<Result>>((ref) {
  final repo = ref.watch(trendingRepoProvider);
  return repo.movies;
});
final trendingLoadingProvider = StateProvider<bool>((ref) {
  final repo = ref.watch(trendingRepoProvider);
  return repo.loading;
});
