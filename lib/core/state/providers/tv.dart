import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_line/core/models/result_model.dart';
import 'package:movie_line/core/state/repositories/tv/airingToday_repo.dart';
import 'package:movie_line/core/state/repositories/tv/onTheAir_repo.dart';
import 'package:movie_line/core/state/repositories/tv/popular_repo.dart';
import 'package:movie_line/core/state/repositories/tv/topRated_repo.dart';

final airingTodayRepoProvider =
    StateNotifierProvider<AiringTodayRepo, AiringTodayState>(
        (ref) => AiringTodayRepo(ref.read));

final airingTodayProvider = StateProvider<List<Result>>((ref) {
  final repo = ref.watch(airingTodayRepoProvider);
  return repo.tvShows;
});
final airingTodayLoadingProvider = StateProvider<bool>((ref) {
  final repo = ref.watch(airingTodayRepoProvider);
  return repo.loading;
});

final onTheAirRepoProvider = StateNotifierProvider<OnTheAirRepo, OnTheAirState>(
    (ref) => OnTheAirRepo(ref.read));

final onTheAirProvider = StateProvider<List<Result>>((ref) {
  final repo = ref.watch(onTheAirRepoProvider);
  return repo.tvShows;
});
final onTheAirLoadingProvider = StateProvider<bool>((ref) {
  final repo = ref.watch(onTheAirRepoProvider);
  return repo.loading;
});

final popularRepoProvider = StateNotifierProvider<PopularRepo, PopularState>(
    (ref) => PopularRepo(ref.read));

final popularProvider = StateProvider<List<Result>>((ref) {
  final repo = ref.watch(popularRepoProvider);
  return repo.tvShows;
});
final popularLoadingProvider = StateProvider<bool>((ref) {
  final repo = ref.watch(popularRepoProvider);
  return repo.loading;
});
final topRatedRepoProvider = StateNotifierProvider<TopRatedRepo, TopRatedState>(
    (ref) => TopRatedRepo(ref.read));

final topRatedProvider = StateProvider<List<Result>>((ref) {
  final repo = ref.watch(topRatedRepoProvider);
  return repo.tvShows;
});
final topRatedLoadingProvider = StateProvider<bool>((ref) {
  final repo = ref.watch(topRatedRepoProvider);
  return repo.loading;
});
