import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_line/core/state/providers/movies.dart';
import 'package:movie_line/core/state/providers/tv.dart';
import 'package:movie_line/features/discover_screen/widgets/movies.dart';
import 'package:movie_line/features/discover_screen/widgets/tvShows.dart';
import 'package:movie_line/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DiscoverTv extends StatefulWidget {
  const DiscoverTv({Key? key}) : super(key: key);

  @override
  State<DiscoverTv> createState() => _DiscoverTvState();
}

class _DiscoverTvState extends State<DiscoverTv> with TickerProviderStateMixin {
  late TabController _tabController;

  void initState() {
    context.read(airingTodayRepoProvider.notifier).getAiringTodayTvShows();
    context.read(onTheAirRepoProvider.notifier).getOnAirTvShows();
    context.read(popularRepoProvider.notifier).getPopularTvShows();
    context.read(topRatedRepoProvider.notifier).getTopRatedTvShows();
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
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      width: 1, color: const Color.fromRGBO(33, 31, 48, 1))),
              margin: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: TextFormField(
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: const Color.fromRGBO(187, 187, 187, 1)),
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    hintStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: const Color.fromRGBO(187, 187, 187, 1)),
                    hintText: 'Sherlock Holmes'),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(24, 15, 68, 5),
              child: Text(
                'TV',
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
                  text: 'Airing Today',
                ),
                Tab(
                  text: 'On Air',
                ),
                Tab(
                  text: 'Popular',
                ),
                Tab(
                  text: 'Top Rated',
                ),
              ],
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
            ),
            Expanded(
              child: TabBarView(
                children: const [
                  AiringTodayScreen(),
                  OnTheAirScreen(),
                  PopularScreen(),
                  TopRatedScreen(),
                ],
                controller: _tabController,
              ),
            )
          ],
        ),
      ),
    );
  }
}
