import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:skip/core/utils/color_contant.dart';
import 'package:skip/widgets/onboarding/utils/helper/confirmation_button.dart';

class TransferBiometric extends StatefulWidget {
  const TransferBiometric({Key? key}) : super(key: key);

  @override
  State<TransferBiometric> createState() => _TransferBiometricState();
}

class _TransferBiometricState extends State<TransferBiometric> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: ColorConstant.darkBlueBackground,
          // color: Colors.green,
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
                      'Face ID Verification',
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
                const Text(
                  'Please put your phone in front of your face',
                  style:
                      TextStyle(color: Colors.white, height: 1.4, fontSize: 18),
                ),
                const SizedBox(height: 30,),
                Image.asset('assets/sign/face_detection.png'),
              ]),
              // const SizedBox(
              //   height: 40,
              // ),
              Column(
                children: <Widget>[
                  ConfirmationButton(
                      text: "Scan My Face",
                      margin: 0,
                      callback: () => Navigator.of(context)
                          .pushNamed('/transfer/amount')),
                  const SizedBox(height: 40,)
                ],
              )
            ],
          )),
    );
  }
}
