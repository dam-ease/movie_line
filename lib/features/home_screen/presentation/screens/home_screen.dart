import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_line/features/home_screen/presentation/widgets/movie_card.dart';
import 'package:movie_line/utils/constants.dart';
import 'package:movie_line/utils/gradient_text.dart';
import 'package:movie_line/utils/movie_data.dart';

class HomeScreen extends StatelessWidget {
  CarouselController controller = CarouselController();
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
                  Stack(
                    children: <Widget>[
                      ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              child: const Image(
                                  image: AssetImage(streamImage),
                                  fit: BoxFit.cover))),
                      Positioned(
                        bottom: 0.0,
                        right: ScreenUtil().setWidth(90),
                        left: 0.0,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                          padding: const EdgeInsets.fromLTRB(20, 11, 14, 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 1,
                                  color: const Color.fromRGBO(
                                      255, 255, 255, 0.25)),
                              color: const Color.fromRGBO(218, 218, 218, 0.3)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Image(
                                image: AssetImage(play),
                                height: 35,
                              ),
                              SizedBox(
                                width: ScreenUtil().setWidth(20),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Continue Watching',
                                    style: headingStyle.copyWith(
                                        fontSize: ScreenUtil().setSp(12),
                                        color: const Color.fromRGBO(
                                            188, 188, 188, 1)),
                                  ),
                                  SizedBox(
                                    height: ScreenUtil().setHeight(5),
                                  ),
                                  Text(
                                    'Ready Player one',
                                    style: headingStyle.copyWith(
                                        fontSize: ScreenUtil().setSp(16),
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(24, 0, 0, 24)),
                  Text(
                    'Trending',
                    style: headingStyle.copyWith(
                        fontSize: ScreenUtil().setSp(24),
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                  ),
                  CarouselSlider(
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
                ],
              ),
            )
          ],
        ),
      );
}
