import 'package:flutter/material.dart';
import 'package:skip/widgets/scan_to_pay/enter_amount.dart';
import 'package:skip/widgets/scan_to_pay/password_confirmation.dart';
import 'package:skip/widgets/scan_to_pay/scan_to_pay.dart';
import 'package:skip/widgets/scan_to_pay/transaction_summary.dart';
import '../../widgets/scan_to_pay/receipt.dart';

class ScanToPayRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    const root = '/scan_to_pay';

    switch (settings.name) {
      case root :
        return MaterialPageRoute(builder: (_) => const ScanToPay());
      case root + '/enter_amout' :
        return MaterialPageRoute(builder: (_) => const EnterAmount());
      case root + '/summary' :
        return MaterialPageRoute(builder: (_) => const TransactionSummary());
      case root + '/password_confirmation' :
        return MaterialPageRoute(builder: (_) => const PasswordConfirmation());
      case root + '/receipt' :
        return MaterialPageRoute(builder: (_) => const Receipt());
      default:
        return MaterialPageRoute(builder: (_) => const ScanToPay());
    }
  }
}
