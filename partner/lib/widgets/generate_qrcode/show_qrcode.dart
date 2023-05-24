import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:skip/core/utils/color_contant.dart';
import 'package:skip/widgets/onboarding/utils/helper/confirmation_button.dart';
import 'package:skip/widgets/root.dart';

import '../../view_models/generate_qr_view_model.dart';
import '../../view_models/user_view_model.dart';

class ShowQrcode extends StatefulWidget {
  const ShowQrcode({Key? key}) : super(key: key);

  @override
  State<ShowQrcode> createState() => _ShowQrcodeState();
}

class _ShowQrcodeState extends State<ShowQrcode> {
  String amount = "";

  @override
  Widget build(BuildContext context) {
    var generateQrViewModel = context.read<GenerateQrViewModel>();
    var userViewModel = context.read<UserViewModel>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          color: ColorConstant.darkBlueBackground,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Qrcode',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        height: 1.4,
                        fontSize: 24),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              RichText(
                  text: const TextSpan(
                text: 'generated qrcode for amount',
                style:
                    TextStyle(color: Colors.white, height: 1.4, fontSize: 20),
              )),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  "EGP${generateQrViewModel.amount}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: "SM Dans",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: QrImage(
                  padding: const EdgeInsets.all(20),
                  backgroundColor: Colors.white,
                  data:
                      '${userViewModel.id},${userViewModel.name},${generateQrViewModel.amount}',
                  version: QrVersions.auto,
                  size: 300,
                  gapless: false,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ConfirmationButton(
                  text: "done",
                  margin: 0,
                  callback: () => (Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const Root()),
                      (Route<dynamic> route) => false))),
            ],
          )),
    );
  }
}
