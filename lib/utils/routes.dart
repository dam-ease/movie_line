import 'package:flutter/material.dart';
import 'package:movie_line/core/models/result_model.dart';
import 'package:movie_line/features/detail_screen/screens/detail_screen.dart';
import 'package:movie_line/utils/route_name.dart';

class Routes {
  Routes._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.detail:
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => DetailScreen(
                  movie: settings.arguments as Movies,
                ));
      default:
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => const Material());
    }
  }
}
