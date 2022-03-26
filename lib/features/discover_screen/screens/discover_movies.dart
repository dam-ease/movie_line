import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_line/core/state/providers/movies.dart';
import 'package:movie_line/core/state/providers/search.dart';
import 'package:movie_line/features/discover_screen/widgets/movies.dart';
import 'package:movie_line/features/discover_screen/widgets/search_bar.dart';
import 'package:movie_line/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DiscoverMovies extends StatefulWidget {
  final TextEditingController? searchController;
  const DiscoverMovies({Key? key, this.searchController}) : super(key: key);

  @override
  State<DiscoverMovies> createState() => _DiscoverMoviesState();
}

class _DiscoverMoviesState extends State<DiscoverMovies>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();

  void initState() {
    context.read(moviesRepoProvider.notifier).getNowPlayingMovies();
    context.read(popularMovieRepoProvider.notifier).getPopularMovies();
    context.read(topRatedMovieRepoProvider.notifier).getTopRatedMovies();
    context.read(upcomingMovieRepoProvider.notifier).getUpcomingMovies();

    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, watch, _) {
      final searchResult = watch(searchProvider.notifier);
      final loading = watch(searchLoadingProvider.notifier);
      return Scaffold(
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(24, 36, 68, 20),
                child: Text(
                  'Find Movies, Tv series,and more..',
                  style: headingStyle.copyWith(
                      fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),
              SearchBar(searchController: widget.searchController),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(24, 15, 68, 5),
                      child: Text(
                        'Movies',
                        style: headingStyle.copyWith(
                            fontSize: ScreenUtil().setSp(18),
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    TabBar(
                      labelPadding: EdgeInsets.zero,
                      indicatorWeight: 5,
                      labelColor: const Color.fromRGBO(255, 143, 113, 1),
                      unselectedLabelColor: Colors.white,
                      indicatorPadding: const EdgeInsets.only(top: 47),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: const BoxDecoration(
                          gradient: gradient,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      tabs: const <Tab>[
                        Tab(
                          text: 'Now Playing',
                        ),
                        Tab(
                          text: 'Popular',
                        ),
                        Tab(
                          text: 'Top Rated',
                        ),
                        Tab(
                          text: 'Upcoming',
                        )
                      ],
                      controller: _tabController,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: const [
                          NowPlayingMovieScreen(),
                          PopularMovieScreen(),
                          TopRatedMovieScreen(),
                          UpcomingMovieScreen(),
                        ],
                        controller: _tabController,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
