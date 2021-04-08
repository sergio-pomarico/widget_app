import 'package:flutter/material.dart';

import 'package:widgets_app/pages/home_page.dart';
import 'package:widgets_app/pages/animation_page.dart';
import 'package:widgets_app/pages/input_page.dart';
import 'package:widgets_app/pages/list_page.dart';

Route<dynamic> getAppRoutes(RouteSettings settings) {
  Map<String, Route<dynamic>> routes = {
    '/': MaterialPageRoute<dynamic>(
      builder: (_) => MyHomePage(),
    ),
    '/animation': MaterialPageRoute<dynamic>(
      builder: (_) => AnimationPage(),
    ),
    '/input': MaterialPageRoute<dynamic>(
      builder: (_) => InputPage(),
    ),
    '/list': MaterialPageRoute<dynamic>(
      builder: (_) => ListPage(),
    ),
  };
  return routes[settings.name];
}
