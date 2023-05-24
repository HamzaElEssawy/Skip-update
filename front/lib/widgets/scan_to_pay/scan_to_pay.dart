import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:skip/view_models/pay_view_model.dart';
import '../../core/utils/color_contant.dart';
import '../../repos/api_status.dart';
import '../../view_models/user_view_model.dart';

class ScanToPay extends StatefulWidget {
  const ScanToPay({Key? key}) : super(key: key);

  @override
  State<ScanToPay> createState() => _ScanToPayState();
}

class _ScanToPayState extends State<ScanToPay> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;
  Barcode? barcode;
  bool isScanned = false;

  @override
  void initState() {
      super.initState();
      context.read<PayViewModel>().clearReceiverData();
    }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    PayViewModel payViewModel = context.read<PayViewModel>();
    UserViewModel userViewModel = context.read<UserViewModel>();

    return Scaffold(
      body: Container(
          color: ColorConstant.darkBlueBackground,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(children: [
                const SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => {Navigator.of(context).pop()},
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 50,
                        )),
                    const Text(
                      'Scan to Pay',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          height: 1.4,
                          fontSize: 24),
                    ),
                    IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => {},
                        icon: const Icon(
                          Icons.help_outline,
                          color: Colors.white,
                          size: 25,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    // Image.asset('assets/scan_to_pay/qr_code.png'),
                    SizedBox(
                        height: MediaQuery.of(context).size.width,
                        child: buildQrView(context)),
                    // buildQrView(context),
                    // Positioned(bottom: 10, child: scanResult())
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // Positioned(bottom: 10, child: scanResult()),
                scanResult(),
                IconButton(
                    onPressed: () => Navigator.of(context)
                        .pushNamed('/scan_to_pay/enter_amout'),
                    icon: const Icon(Icons.arrow_forward))
              ]),
            ],
          )),
    );
  }

  Widget scanResult() => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.grey),
        // child: Text(barcode != null ? '${barcode!.code}' : 'scan a code'),
        child: Text(barcode != null ? barcode!.code.toString() : 'scan a code'),
      );

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          // cutOutSize: MediaQuery.of(context).size.width * 0.8,
          borderColor: ColorConstant.teal,
          borderRadius: 10,
          borderLength: 20,
          borderWidth: 10,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((barcode) {
      if (!isScanned) {
        setState(() {
          isScanned = true;
          this.barcode = barcode;
          Future.delayed(const Duration(seconds: 1), () async {
            var codeParts = barcode.code?.split(',');
            if (barcode.code != null && codeParts != null) {
              // var token = context.read<UserViewModel>().token;
              context.read<PayViewModel>().receiverId = codeParts[0];
              context.read<PayViewModel>().receiverName = codeParts[1];
              var response =
                  await context.read<PayViewModel>().getReceiverData();
              if (response is Success) {
                await Navigator.of(context)
                    .pushNamed('/scan_to_pay/enter_amout');
                isScanned = false;
              }
              if (response is Failure) {
                var snackBar = SnackBar(
                  content: Text(response.body.toString()),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                return;
              }
            }
          });
        });
      }
    });
  }
}
