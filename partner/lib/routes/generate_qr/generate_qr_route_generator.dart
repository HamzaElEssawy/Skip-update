import 'package:flutter/material.dart';
import 'package:skip/widgets/generate_qrcode/generate_qrcode.dart';
import '../../widgets/generate_qrcode/show_qrcode.dart';

class GenerateQrRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    const root = '/generate_qr';

    switch (settings.name) {
      case root :
        return MaterialPageRoute(builder: (_) => const GenerateQrcode());
      case root + '/show_qr' :
        return MaterialPageRoute(builder: (_) => const ShowQrcode());
      default:
        return MaterialPageRoute(builder: (_) => const GenerateQrcode());
    }
  }
}
