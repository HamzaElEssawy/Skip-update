import 'package:flutter/material.dart';
import 'package:skip/widgets/notifications/notifications.dart';
import 'package:skip/widgets/profile/my_qrcode.dart';
import 'package:skip/widgets/profile/profile.dart';
import '../../widgets/home/home.dart';

class HomeRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    const root = '/home';

    switch (settings.name) {
      case root:
        return MaterialPageRoute(builder: (_) => const Home());
      case root + '/notifications':
        return MaterialPageRoute(builder: (_) => Notifications());
      case root + '/profile':
        return MaterialPageRoute(builder: (_) => const Profile());
      case root + '/my_qrcode':
        return MaterialPageRoute(builder: (_) => const MyQrcode());
      default:
        return MaterialPageRoute(builder: (_) => const Home());
    }
  }
}
