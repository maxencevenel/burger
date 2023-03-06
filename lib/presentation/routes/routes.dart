

import 'package:flutter/material.dart';
import 'package:useradgents_burger/presentation/views/root_page.dart';

abstract class Routes {
  static Map<String, WidgetBuilder> routes = {
    RootPage.route: (context) => const RootPage(),
  };
}