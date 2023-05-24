import 'package:flutter/material.dart';
import 'package:skip/routes/home/home_route_generator.dart';
import 'package:skip/routes/sign/sign_route_generator.dart';
import 'package:skip/widgets/root.dart';
import 'package:skip/widgets/onboarding/onboarding.dart';

import 'generate_qr/generate_qr_route_generator.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    if(settings.name == '/'){
        return MaterialPageRoute(builder: (_) => const Root());
    }
      
    List<String> urlParts = settings.name!.split('/');

    switch (urlParts[1]) {
      case 'onboarding':
        return MaterialPageRoute(builder: (_) => const Onboarding());
      case 'sign':
        return SignRouteGenerator.generateRoute(settings);
      case 'home':
        return HomeRouteGenerator.generateRoute(settings);
      case 'generate_qr':
        return GenerateQrRouteGenerator.generateRoute(settings);
      default:
        return HomeRouteGenerator.generateRoute(settings);
    }
  }
}
