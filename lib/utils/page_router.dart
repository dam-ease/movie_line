import 'package:flutter/material.dart';

class PageRouter {
  static Future gotoNamed(String route, BuildContext context,
          {bool clearSack = false, dynamic args = Object}) =>
      !clearSack
          ? Navigator.of(context).pushNamed(route, arguments: args)
          : Navigator.of(context)
              .pushNamedAndRemoveUntil(route, (_) => false, arguments: args);
}
