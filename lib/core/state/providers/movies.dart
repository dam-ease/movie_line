import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_line/core/models/result_model.dart';
import 'package:movie_line/core/state/repositories/movies/latest_movie_repo.dart';
import 'package:movie_line/core/state/repositories/movies/now_playing_repo.dart';
import 'package:movie_line/core/state/repositories/movies/popular_movie_repo.dart';
import 'package:movie_line/core/state/repositories/movies/topRated_movie_repo.dart';
import 'package:movie_line/core/state/repositories/movies/upcoming_movies_repo.dart';

final moviesRepoProvider =
    StateNotifierProvider<NowPlayingMoviesRepo, NowPlayingMoviesState>(
        (ref) => NowPlayingMoviesRepo(ref.read));

final moviesProvider = StateProvider<List<Result>>((ref) {
  final repo = ref.watch(moviesRepoProvider);
  return repo.movies;
});
final moviesLoadingProvider = StateProvider<bool>((ref) {
  final repo = ref.watch(moviesRepoProvider);
  return repo.loading;
});

final latestMovieRepoProvider =
    StateNotifierProvider<LatestMovieRepo, LatestMovieState>(
        (ref) => LatestMovieRepo(ref.read));

final latestMovieProvider = StateProvider<Result>((ref) {
  final repo = ref.watch(latestMovieRepoProvider);
  return repo.movies;
});
final latestMovieLoadingProvider = StateProvider<bool>((ref) {
  final repo = ref.watch(latestMovieRepoProvider);
  return repo.loading;
});

final popularMovieRepoProvider =
    StateNotifierProvider<PopularMoviesRepo, PopularMoviesState>(
        (ref) => PopularMoviesRepo(ref.read));

final popularMovieProvider = StateProvider<List<Result>>((ref) {
  final repo = ref.watch(popularMovieRepoProvider);
  return repo.movies;
});
final popularMovieLoadingProvider = StateProvider<bool>((ref) {
  final repo = ref.watch(popularMovieRepoProvider);
  return repo.loading;
});

final topRatedMovieRepoProvider =
    StateNotifierProvider<TopRatedMoviesRepo, TopRatedMoviesState>(
        (ref) => TopRatedMoviesRepo(ref.read));

final topRatedMovieProvider = StateProvider<List<Result>>((ref) {
  final repo = ref.watch(topRatedMovieRepoProvider);
  return repo.movies;
});
final topRatedMovieLoadingProvider = StateProvider<bool>((ref) {
  final repo = ref.watch(topRatedMovieRepoProvider);
  return repo.loading;
});

final upcomingMovieRepoProvider =
    StateNotifierProvider<UpcomingMoviesRepo, UpcomingMoviesState>(
        (ref) => UpcomingMoviesRepo(ref.read));

final upcomingMovieProvider = StateProvider<List<Result>>((ref) {
  final repo = ref.watch(upcomingMovieRepoProvider);
  return repo.movies;
});
final upcomingMovieLoadingProvider = StateProvider<bool>((ref) {
  final repo = ref.watch(popularMovieRepoProvider);
  return repo.loading;
});
