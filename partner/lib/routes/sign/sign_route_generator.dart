import 'package:flutter/material.dart';
import 'package:skip/widgets/sign/sign_in.dart';
import 'package:skip/widgets/sign/sign_up.dart';
import 'package:skip/widgets/sign/sign_up_biometric.dart';
import 'package:skip/widgets/sign/sign_up_get_started.dart';
import 'package:skip/widgets/sign/sign_up_phone.dart';
import 'package:skip/widgets/sign/sign_up_verify_phone.dart';

class SignRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    const root = '/sign';

    switch (settings.name) {
      case root + '/in':
        return MaterialPageRoute(builder: (_) => const SignIn());

      // sign up routes
      case root + '/up':
        return MaterialPageRoute(builder: (_) => const SignUp());
      case root + '/up/phone':
        return MaterialPageRoute(builder: (_) => const SignUpPhone());
      case root + '/up/verify_phone':
        return MaterialPageRoute(builder: (_) => const SignUpVerifyPhone());
      case root + '/up/biometric':
        return MaterialPageRoute(builder: (_) => const SignUpBiometric());
      case root + '/up/get_started':
        return MaterialPageRoute(builder: (_) => const SignUpGetStarted());
      default:
        return MaterialPageRoute(builder: (_) => const SignIn());
    }
  }
}
