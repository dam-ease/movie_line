import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_line/core/models/result_model.dart';
import 'package:movie_line/core/state/providers/trending.dart';
import 'package:movie_line/features/home_screen/presentation/widgets/movie_card.dart';

class TrendingMovies extends StatefulWidget {
  final List<Result> movies;
  const TrendingMovies({Key? key, required this.movies}) : super(key: key);

  @override
  State<TrendingMovies> createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  @override
  Widget build(BuildContext context) {
    CarouselController controller = CarouselController();
    return CarouselSlider(
      carouselController: controller,
      items: widget.movies.map((e) => MovieCardWidget(movie: e)).toList(),
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
    );
  }
}
