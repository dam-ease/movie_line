import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_line/features/home_screen/presentation/screens/home_screen.dart';
import 'package:movie_line/features/home_screen/presentation/widgets/bottom_nav_bar.dart';
import 'package:movie_line/utils/constants.dart';

void main() {
  runApp(MovieLine());
}

class MovieLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => MaterialApp(
            theme: ThemeData(scaffoldBackgroundColor: bgColor),
            debugShowCheckedModeBanner: false,
            title: 'Movie Line',
            home: BottomNavBar()),
      );
}
