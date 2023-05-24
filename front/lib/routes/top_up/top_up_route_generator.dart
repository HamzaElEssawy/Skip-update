import 'package:flutter/material.dart';
import '../../widgets/top_up/top_up.dart';

class TopUpRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    const root = '/top_up';

    switch (settings.name) {
      case root :
        return MaterialPageRoute(builder: (_) => const TopUp());
      default:
        return MaterialPageRoute(builder: (_) => const TopUp());
    }
  }
}
