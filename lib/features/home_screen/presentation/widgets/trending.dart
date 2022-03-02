import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_line/core/models/result_model.dart';
import 'package:movie_line/core/state/providers/trending.dart';
import 'package:movie_line/features/home_screen/presentation/widgets/movie_card.dart';

class TrendingMovies extends StatefulWidget {
  const TrendingMovies({Key? key}) : super(key: key);

  @override
  State<TrendingMovies> createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  @override
  void initState() {
    context.read(trendingRepoProvider.notifier).getTrendingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CarouselController controller = CarouselController();
    return Consumer(builder: (__, watch, _) {
      final List<Movies> movies = watch(trendingProvider).state;

      final bool isLoading = watch(trendingLoadingProvider).state;
      return isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.white,
            ))
          : movies.length > 0
              ? CarouselSlider(
                  carouselController: controller,
                  items: movies.map((e) => MovieCardWidget(movie: e)).toList(),
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    viewportFraction: 0.68,
                    height: 336,
                    enlargeCenterPage: true,
                    onPageChanged: (index, _) => controller.animateToPage(
                      index,
                      duration: const Duration(seconds: 1),
                      curve: Curves.ease,
                    ),
                  ),
                )
              : Container();
    });
  }
}
