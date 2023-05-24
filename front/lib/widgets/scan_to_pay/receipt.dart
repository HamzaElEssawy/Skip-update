import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skip/core/utils/color_contant.dart';
import 'package:skip/widgets/onboarding/utils/helper/confirmation_button.dart';
import 'package:skip/widgets/onboarding/utils/helper/described_text.dart';
import 'package:skip/widgets/root.dart';

import '../../view_models/pay_view_model.dart';

class Receipt extends StatelessWidget {
  const Receipt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var payViewModel = context.read<PayViewModel>();

    return Scaffold(
      body: Container(
          color: ColorConstant.darkBlueBackground,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/scan_to_pay/receipt_decorations.png'),
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: <Widget>[
                    Image.asset('assets/scan_to_pay/receipt_paper.png'),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          height: 30,
                        ),
                        Image.asset('assets/scan_to_pay/icon_success.png'),
                        const SizedBox(
                          height: 20,
                        ),
                        DescribedText(
                            textTitle: 'Payment Success',
                            textDescription:
                                'Your payment for ${payViewModel.receiverName} has been successfully sent'),
                        const Text('Total Payment',
                            style: TextStyle(
                                fontFamily: "SM Dans",
                                fontSize: 16,
                                color: Colors.grey)),
                        Text(
                          "EGP${payViewModel.amount + 10}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: ColorConstant.darkBlueBackground,
                            fontSize: 48,
                            fontFamily: "SM Dans",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                            width: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text('Payment For',
                                    style: TextStyle(
                                        fontFamily: "SM Dans",
                                        fontSize: 16,
                                        color: Colors.grey)),
                                const SizedBox(height: 10),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xfff2f2f2)),
                                    padding: const EdgeInsets.all(10),
                                    child: Row(children: <Widget>[
                                      const SizedBox(width: 10),
                                      SizedBox(
                                        width: 45,
                                        height: 45,
                                        child: payViewModel
                                                .receiverImageUrlExists
                                            ? Image.network(
                                                payViewModel.receiverImageUrl)
                                            : Image.asset(
                                                'assets/scan_to_pay/default-small.jpg'),
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        children: <Widget>[
                                          Text(payViewModel.receiverName,
                                              style: const TextStyle(
                                                  fontFamily: "SM Dans",
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  color: ColorConstant
                                                      .darkBlueBackground)),
                                          Text(getNowFormatedDate(),
                                              style: const TextStyle(
                                                  fontFamily: "SM Dans",
                                                  fontSize: 16,
                                                  color: Colors.grey)),
                                        ],
                                      )
                                    ])),
                              ],
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                        ConfirmationButton(
                            text: "Done",
                            margin: 50,
                            callback: () => Navigator.of(context)
                                .pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => const Root()),
                                    (Route<dynamic> route) => false))
                      ],
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }

  String getNowFormatedDate() {
    DateTime now = DateTime.now();
    DateFormat format = DateFormat('MMM dd, yyyy - hh:mm a');
    return format.format(now);
  }
}
