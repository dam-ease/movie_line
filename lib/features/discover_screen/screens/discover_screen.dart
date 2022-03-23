import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_line/features/discover_screen/widgets/movies.dart';
import 'package:movie_line/utils/constants.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> with TickerProviderStateMixin {
  late TabController _tabController;

  void initState() {
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
              margin: const EdgeInsets.fromLTRB(24, 0, 24, 15),
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
                  text: 'Movies',
                ),
                Tab(
                  text: 'Tv Series',
                ),
                Tab(
                  text: 'Documentary',
                ),
                Tab(
                  text: 'Sports',
                )
              ],
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  MovieScreen(),
                  MovieScreen(),
                  MovieScreen(),
                  MovieScreen()
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
