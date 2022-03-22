import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_line/core/models/result_model.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        body: ListView(
          children: [
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
                  Consumer(builder: (__, watch, _) {
                    final List<Movies> movies = watch(trendingProvider).state;
                    final bool isLoading = watch(trendingLoadingProvider).state;
                    return isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                        : movies.isNotEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Continue(
                                    movies: movies,
                                  ),
                                  const SizedBox(height: 25),
                                  Text(
                                    'Trending',
                                    style: headingStyle.copyWith(
                                        fontSize: ScreenUtil().setSp(24),
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1)),
                                  ),
                                  TrendingMovies(
                                    movies: movies,
                                  )
                                ],
                              )
                            : Container();
                  })
                ],
              ),
            )
          ],
        ),
      );
}
