import 'package:flutter/material.dart';
import 'package:skip/widgets/transfer/receipt.dart';
import 'package:skip/widgets/transfer/transfer_biometric.dart';
import '../../widgets/transfer/transfer_amount.dart';
import '../../widgets/transfer/transfer_confirm.dart';

class TransferRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    const root = '/transfer';

    switch (settings.name) {
      case root + '/biometric':
        return MaterialPageRoute(builder: (_) => const TransferBiometric());
      case root + '/amount':
        return MaterialPageRoute(builder: (_) => const TransferAmount());
      case root + '/confirm':
        return MaterialPageRoute(builder: (_) => const TransferConfirm());
      case root + '/receipt':
        return MaterialPageRoute(builder: (_) => const Receipt());
      default:
        return MaterialPageRoute(builder: (_) => const TransferBiometric());
    }
  }
}
