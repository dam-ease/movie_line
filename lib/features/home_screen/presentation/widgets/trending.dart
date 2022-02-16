import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_line/core/state/providers/trending.dart';
import 'package:movie_line/features/home_screen/presentation/widgets/movie_card.dart';
import 'package:movie_line/utils/movie_data.dart';

class TrendingMovies extends ConsumerWidget {
  CarouselController controller = CarouselController();
  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(trendingListProvider).when(
            data: (data) => data.isEmpty
                ? Container()
                : CarouselSlider(
                    carouselController: controller,
                    items:
                        movies.map((e) => MovieCardWidget(movie: e)).toList(),
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
                  ),
            loading: () => const Center(
              child: CupertinoActivityIndicator(),
            ),
            error: (e, _) => CarouselSlider(
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
            ),
          );
}
