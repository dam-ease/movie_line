import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_line/core/state/repositories/movies/trending_repo.dart';
import 'package:movie_line/utils/constants.dart';
import 'package:movie_line/utils/route_name.dart';
import 'package:movie_line/utils/routes.dart';
import 'package:oktoast/oktoast.dart';

class MockTrendingMovies extends Mock implements TrendingRepo {}

void main() {
  late MockTrendingMovies mockTrendingMovies;
  setUp(() {
    mockTrendingMovies = MockTrendingMovies();
  });

  Widget createWidgetUnderTest() {
    return ProviderScope(
      child: OKToast(
        duration: Duration(seconds: 2),
        movingOnWindowChange: true,
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: () => MaterialApp(
            theme: ThemeData(scaffoldBackgroundColor: bgColor),
            debugShowCheckedModeBanner: false,
            title: 'Movie Line',
            initialRoute: RouteName.root,
            onGenerateRoute: Routes.generateRoute,
          ),
        ),
      ),
    );
  }

  // testWidgets('Title is displayed', (tester) async {
  //   await tester.pumpWidget(createWidgetUnderTest());
  //   expect(find.text('Trending'), findsOneWidget);
  // });
}
