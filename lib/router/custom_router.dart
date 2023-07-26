import 'package:chnage_language_with_button/pages/not_found_screen.dart';
import 'package:flutter/material.dart';

import '../pages/about_screen.dart';
import '../pages/home_screen.dart';
import '../pages/settings_screen.dart';
import 'route_constants.dart';


class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => const AboutPage());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
