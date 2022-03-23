import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_line/features/home_screen/presentation/screens/home_screen.dart';
import 'package:movie_line/features/home_screen/presentation/widgets/bottom_nav_bar.dart';
import 'package:movie_line/utils/constants.dart';
import 'package:movie_line/utils/route_configuration.dart';
import 'package:movie_line/utils/route_name.dart';

void main() {
  runApp(ProviderScope(child: MovieLine()));
}

class MovieLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: bgColor),
          debugShowCheckedModeBanner: false,
          title: 'Movie Line',
          initialRoute: RouteName.root,
          onGenerateRoute: RouteConfiguration.onGenerateRoute,
        ),
      );
}
