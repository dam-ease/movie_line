import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_line/core/models/result_model.dart';
import 'package:movie_line/core/state/providers/movies.dart';
import 'package:movie_line/core/state/providers/trending.dart';
import 'package:movie_line/features/home_screen/presentation/widgets/continue.dart';
import 'package:movie_line/features/home_screen/presentation/widgets/trending.dart';
import 'package:movie_line/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_line/utils/gradient_text.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read(trendingRepoProvider.notifier).getTrendingMovies();
    // context.read(latestMovieRepoProvider.notifier).getLatestMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Consumer(builder: (__, watch, _) {
        final List<Result> trendingMovies = watch(trendingProvider).state;
        final bool isLoadingTrending = watch(trendingLoadingProvider).state;
        // final Result latestMovie = watch(latestMovieProvider).state;
        // final bool isLoadingLatestMovie =
        //     watch(latestMovieLoadingProvider).state;
        return Scaffold(
            extendBodyBehindAppBar: true,
            body: ListView(children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(24, 44, 24, 36),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GradientText('Stream',
                                style: headingStyle, gradient: gradient),
                            SizedBox(
                              width: ScreenUtil().setWidth(7),
                            ),
                            Text(
                              'Everywhere',
                              style: headingStyle.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                        const SizedBox(height: 28),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            isLoadingTrending
                                ? const Center(
                                    child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ))
                                : trendingMovies.isNotEmpty
                                    ? Continue(
                                        movies: trendingMovies.last,
                                      )
                                    : Container(),
                            const SizedBox(height: 25),
                            Text(
                              'Trending',
                              style: headingStyle.copyWith(
                                  fontSize: ScreenUtil().setSp(24),
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 1)),
                            ),
                            isLoadingTrending
                                ? const Center(
                                    child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ))
                                : trendingMovies.isNotEmpty
                                    ? TrendingMovies(
                                        movies: trendingMovies,
                                      )
                                    : Container()
                          ],
                        )
                      ]))
            ]));
      });
}
