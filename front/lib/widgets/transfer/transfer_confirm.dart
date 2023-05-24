import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skip/core/utils/color_contant.dart';
import 'package:skip/view_models/pay_view_model.dart';
import 'package:skip/widgets/onboarding/utils/helper/confirmation_button.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

import '../../repos/api_status.dart';
import '../../view_models/user_view_model.dart';

class TransferConfirm extends StatelessWidget {
  const TransferConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var payViewModel = context.read<PayViewModel>();
    var userViewModel = context.read<UserViewModel>();

    return Scaffold(
        // extendBody: true,
        backgroundColor: ColorConstant.darkBlueBackground,
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.only(left: 35, right: 35, bottom: 35),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => {Navigator.of(context).pop()},
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 40,
                          )),
                      const Text(
                        'Confirm Transfer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "DM Sans",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Image.asset('assets/transfer/transfer-person.png'),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Image.asset('assets/transfer/amount.png'),
                  Column(children: [
                    ClipRRect(
                      // child: Image.asset('assets/scan_to_pay/starbucks.png'),
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.white70,
                        padding: const EdgeInsets.all(10),
                        child: payViewModel.receiverImageUrlExists
                            ? Image.network(payViewModel.receiverImageUrl)
                            : Image.asset(
                                'assets/scan_to_pay/default-small.jpg'),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      payViewModel.receiverName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          height: 1.4,
                          fontSize: 24),
                    ),
                    Text(
                      payViewModel.receiverPhone,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          height: 1.4,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'payment on ' + getNowFormatedDate(),
                      style: const TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w300,
                          height: 1.4,
                          fontSize: 18),
                    ),
                    Text(
                      "EGP" + (payViewModel.amount).toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontFamily: "Barlow",
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ]),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ConfirmationSlider(
                          text: 'slide to confirm',
                          foregroundColor: ColorConstant.teal,
                          onConfirmation: () async {
                            var response =
                                await payViewModel.pay(userViewModel.token);
                            if (response is Success) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/transfer/receipt',
                                  (Route<dynamic> route) => false);
                            }
                            if (response is Failure) {
                              var snackBar = SnackBar(
                                content: Text(response.body),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              return;
                            }
                          }),
                      const SizedBox(
                        height: 40,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  )),
            )
          ],
        ));
  }

  String getNowFormatedDate() {
    DateTime now = DateTime.now();
    DateFormat format = DateFormat('MMMM dd, yyyy - hh:mm a');
    return format.format(now);
  }
}
