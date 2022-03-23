import 'package:flutter/material.dart';
import 'package:movie_line/core/models/result_model.dart';
import 'package:movie_line/features/detail_screen/screens/detail_screen.dart';
import 'package:movie_line/features/discover_screen/screens/discover_screen.dart';
import 'package:movie_line/features/home_screen/presentation/screens/home_screen.dart';
import 'package:movie_line/features/home_screen/presentation/widgets/bottom_nav_bar.dart';
import 'package:movie_line/utils/route_name.dart';

typedef PageBuilder = Route<Object?> Function(RouteSettings);

class Path {
  const Path(this.pattern, this.builder, [this.isProtectedRoute = true]);
  final String pattern;
  final bool isProtectedRoute;
  final PageBuilder builder;
}

class RouteConfiguration {
  static List<Path> paths = [
    Path(
      r'^' + RouteName.homeScreen + '\$',
      (_) => MaterialPageRoute(builder: (context) => HomeScreen()),
    ),
    Path(
      r'^' + RouteName.discoverScreen + '\$',
      (_) => MaterialPageRoute(builder: (context) => Discover()),
    ),
    Path(
        r'^' + RouteName.detail + '\$',
        (settings) => MaterialPageRoute(
            builder: (context) =>
                DetailScreen(movie: settings.arguments as Movies),
            settings: settings)),
    Path(r'^' + RouteName.root + '\$',
        (_) => MaterialPageRoute(builder: (context) => BottomNavBar()), false),
  ];
  static Route<Object?>? _router(Path path, RouteSettings settings) {
    return path.builder(settings);
  }

  static Route<Object?>? onGenerateRoute(RouteSettings settings) {
    for (Path path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name!)) {
        return _router(path, settings);
      }
    }
  }

  static List<Route<Object?>> onGenerateInitialRoutes(
      NavigatorState state, String path) {
    WidgetBuilder builder;
    switch (path) {
      case RouteName.homeScreen:
        builder = (_) => HomeScreen();
        break;
      case RouteName.discoverScreen:
        builder = (_) => Discover();
        break;
      default:
        builder = (_) => BottomNavBar();
    }
    return [MaterialPageRoute(builder: builder)];
  }
}
