import 'package:flutter/material.dart';

class PageRouter {
  static Future gotoNamed(String route, BuildContext context,
          {bool clearSack = false,
          bool rootNavigator = false,
          dynamic args = Object}) =>
      !clearSack
          ? Navigator.of(context, rootNavigator: rootNavigator)
              .pushNamed(route, arguments: args)
          : Navigator.of(context, rootNavigator: rootNavigator)
              .pushNamedAndRemoveUntil(route, (_) => false, arguments: args);
}
