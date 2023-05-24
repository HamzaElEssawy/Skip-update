import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skip/core/utils/color_contant.dart';
import 'package:skip/widgets/onboarding/utils/helper/confirmation_button.dart';

import '../../view_models/generate_qr_view_model.dart';

class GenerateQrcode extends StatefulWidget {
  const GenerateQrcode({Key? key}) : super(key: key);

  @override
  State<GenerateQrcode> createState() => _GenerateQrcodeState();
}

class _GenerateQrcodeState extends State<GenerateQrcode> {
  String amount = "";

  @override
  Widget build(BuildContext context) {
    var generateQrViewModel = context.read<GenerateQrViewModel>();

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
                    'Generate Qrcode',
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
                text: 'generate qr code for amount',
                style:
                    TextStyle(color: Colors.white, height: 1.4, fontSize: 20),
              )),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80,
                    child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                        onChanged: (amount) {
                          this.amount = amount;
                        },
                        decoration: const InputDecoration(
                            hintText: "amount",
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorConstant.teal, width: 3),
                            ))),
                  ),
                  const SizedBox(width: 15),
                  const Text('EGP', style: TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Center(child: Icon(Icons.qr_code_rounded, color: Colors.white, size: 220)),
              const SizedBox(
                height: 30,
              ),
              ConfirmationButton(
                  text: "Generate QR",
                  margin: 0,
                  callback: () {
                    if (amount.isNotEmpty) {
                      try {
                        double doubleAmount = double.parse(amount);
                        generateQrViewModel.amount = doubleAmount;
                      } on FormatException {
                        var snackBar = const SnackBar(
                          content: Text("invalid amount"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }
                      Navigator.of(context).pushNamed('/generate_qr/show_qr');
                    }
                  }),
            ],
          )),
    );
  }

  String getNowFormatedDate() {
    DateTime now = DateTime.now();
    DateFormat format = DateFormat('MMMM dd, yyyy - hh:mm a');
    return format.format(now);
  }
}
