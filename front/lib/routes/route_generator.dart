import 'package:flutter/material.dart';
import 'package:skip/routes/home/home_route_generator.dart';
import 'package:skip/routes/scan_to_pay/scan_to_pay_route_generator.dart';
import 'package:skip/routes/sign/sign_route_generator.dart';
import 'package:skip/routes/top_up/top_up_route_generator.dart';
import 'package:skip/routes/transfer/transfer_route_generator.dart';
import 'package:skip/widgets/root.dart';
import 'package:skip/widgets/onboarding/onboarding.dart';

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
      case 'top_up':
        return TopUpRouteGenerator.generateRoute(settings);
      case 'transfer':
        return TransferRouteGenerator.generateRoute(settings);
      case 'scan_to_pay':
        return ScanToPayRouteGenerator.generateRoute(settings);
      default:
        return HomeRouteGenerator.generateRoute(settings);
    }
  }
}
