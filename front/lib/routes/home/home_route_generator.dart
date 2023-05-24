import 'package:flutter/material.dart';
import 'package:skip/widgets/activity/activity.dart';
import 'package:skip/widgets/mobile_credit/mobile_credit.dart';
import 'package:skip/widgets/notifications/notifications.dart';
import 'package:skip/widgets/profile/profile.dart';
import 'package:skip/widgets/shop/shop.dart';
import 'package:skip/widgets/statistics/statistics.dart';
import 'package:skip/widgets/utilities/utilities.dart';
import '../../widgets/home/home.dart';

class HomeRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    const root = '/home';

    switch (settings.name) {
      case root:
        return MaterialPageRoute(builder: (_) => const Home());
      case root + '/activity':
        return MaterialPageRoute(builder: (_) => Activity());
      case root + '/shop':
        return MaterialPageRoute(builder: (_) => Shop());
      case root + '/utilities':
        return MaterialPageRoute(builder: (_) => Utilities());
      case root + '/mobile_credit':
        return MaterialPageRoute(builder: (_) => MobileCredit());
      case root + '/statistics':
        return MaterialPageRoute(builder: (_) => Statistics());
      case root + '/notifications':
        return MaterialPageRoute(builder: (_) => Notifications());
      case root + '/profile':
        return MaterialPageRoute(builder: (_) => const Profile());

      default:
        return MaterialPageRoute(builder: (_) => const Home());
    }
  }
}
