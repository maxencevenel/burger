

import 'package:flutter/material.dart';
import 'package:useradgents_burger/presentation/views/burger_detail/burger_detail_page.dart';
import 'package:useradgents_burger/presentation/views/root_page.dart';

abstract class Routes {
  static Map<String, WidgetBuilder> routes = {
    RootPage.route: (context) => const RootPage(),
    BurgerDetailPage.route: (context) => const BurgerDetailPage(),
  };
}