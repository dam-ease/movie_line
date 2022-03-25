import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_line/core/models/result_model.dart';
import 'package:movie_line/core/state/providers/movies.dart';
import 'package:movie_line/core/state/providers/tv.dart';
import 'package:movie_line/features/discover_screen/widgets/screen_list.dart';

class AiringTodayScreen extends ConsumerWidget {
  const AiringTodayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final List<Result> tvShows = watch(airingTodayProvider).state;
    final bool isLoading = watch(airingTodayLoadingProvider).state;
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.white,
          ))
        : tvShows.isNotEmpty
            ? ScreenList(screen: tvShows)
            : Container();
  }
}

class PopularScreen extends ConsumerWidget {
  const PopularScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final List<Result> tvShows = watch(popularProvider).state;
    final bool isLoading = watch(popularLoadingProvider).state;
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.white,
          ))
        : tvShows.isNotEmpty
            ? ScreenList(screen: tvShows)
            : Container();
  }
}

class TopRatedScreen extends ConsumerWidget {
  const TopRatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final List<Result> tvShows = watch(topRatedProvider).state;
    final bool isLoading = watch(topRatedLoadingProvider).state;
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.white,
          ))
        : tvShows.isNotEmpty
            ? ScreenList(screen: tvShows)
            : Container();
  }
}

class OnTheAirScreen extends ConsumerWidget {
  const OnTheAirScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final List<Result> tvShows = watch(onTheAirProvider).state;
    final bool isLoading = watch(onTheAirLoadingProvider).state;
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.white,
          ))
        : tvShows.isNotEmpty
            ? ScreenList(screen: tvShows)
            : Container();
  }
}
