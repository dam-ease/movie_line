import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movie_line/core/models/result_model.dart';
import 'package:movie_line/core/state/providers/movies.dart';
import 'package:movie_line/features/discover_screen/widgets/screen_list.dart';
import 'package:movie_line/utils/constants.dart';

List data = [soul, knives, onward, mulan, birds, now];
List title = [
  'Soul(2020)',
  'Knives Out (2019)',
  'Onward (2020)',
  'Mulan (2020)',
  'Birds of Prey (2020)',
  'Now You See Me 2 (2016)'
];

class NowPlayingMovieScreen extends ConsumerWidget {
  const NowPlayingMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final List<Result> movies = watch(moviesProvider).state;
    final bool isLoading = watch(moviesLoadingProvider).state;
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.white,
          ))
        : movies.isNotEmpty
            ? ScreenList(screen: movies)
            : Container();
  }
}

class PopularMovieScreen extends ConsumerWidget {
  const PopularMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final List<Result> movies = watch(popularMovieProvider).state;
    final bool isLoading = watch(popularMovieLoadingProvider).state;
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.white,
          ))
        : movies.isNotEmpty
            ? ScreenList(screen: movies)
            : Container();
  }
}

class TopRatedMovieScreen extends ConsumerWidget {
  const TopRatedMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final List<Result> movies = watch(topRatedMovieProvider).state;
    final bool isLoading = watch(topRatedMovieLoadingProvider).state;
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.white,
          ))
        : movies.isNotEmpty
            ? ScreenList(screen: movies)
            : Container();
  }
}

class UpcomingMovieScreen extends ConsumerWidget {
  const UpcomingMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final List<Result> movies = watch(upcomingMovieProvider).state;
    final bool isLoading = watch(upcomingMovieLoadingProvider).state;
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.white,
          ))
        : movies.isNotEmpty
            ? ScreenList(screen: movies)
            : Container();
  }
}
