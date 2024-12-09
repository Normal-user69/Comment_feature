library route_pages;

import 'package:final_task/src/features/comment/presentation/screens/home.dart';
import 'package:flutter/material.dart';
import '/src/core/error/error.dart';
import 'routes.dart';

class AppRoute {
  static const initial = RoutesName.initial;
  static Route<dynamic> generate(RouteSettings? settings) {
    switch (settings?.name) {
      case RoutesName.initial:
        return MaterialPageRoute(builder: (context) => const CommentPage());

      default:
        // If there is no such named route in the switch statement
        throw const RouteException('Route not found!');
    }
  }
}
