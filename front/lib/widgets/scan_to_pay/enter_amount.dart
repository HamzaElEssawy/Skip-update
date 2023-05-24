import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skip/core/utils/color_contant.dart';
import 'package:skip/view_models/pay_view_model.dart';
import 'package:skip/widgets/onboarding/utils/helper/confirmation_button.dart';

class EnterAmount extends StatefulWidget {
  const EnterAmount({Key? key}) : super(key: key);

  @override
  State<EnterAmount> createState() => _EnterAmountState();
}

class _EnterAmountState extends State<EnterAmount> {
  String amount = "";

  @override
  Widget build(BuildContext context) {
    var payViewModel = context.read<PayViewModel>();

    return Scaffold(
      body: Container(
          color: ColorConstant.darkBlueBackground,
          // color: Colors.green,
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
                    'Enter Amount',
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
                text: 'Enter the payment amount for ',
                style:
                    TextStyle(color: Colors.white, height: 1.4, fontSize: 20),
              )),
              const SizedBox(
                height: 20,
              ),
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
                      child: payViewModel.receiverImageUrlExists
                          ? Image.network(payViewModel.receiverImageUrl)
                          : Image.asset('assets/scan_to_pay/default-small.jpg'),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: <Widget>[
                        // const Text('Shawerma El Reem',
                        Text(payViewModel.receiverName,
                            style: const TextStyle(
                                fontFamily: "SM Dans",
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: ColorConstant.darkBlueBackground)),
                        // Text('Dec 2, 2020 - 3:02 pm',
                        Text(getNowFormatedDate(),
                            style: const TextStyle(
                                fontFamily: "SM Dans",
                                fontSize: 16,
                                color: Colors.grey)),
                      ],
                    )
                  ])),
              const SizedBox(
                height: 30,
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
              const SizedBox(
                height: 30,
              ),
              ConfirmationButton(
                  text: "Continue",
                  margin: 0,
                  callback: () {
                    if (amount.isNotEmpty) {
                      try {
                        double doubleAmount = double.parse(amount);
                        // Provider.of<PayViewModel>(context, listen: false)
                        //     .amount = doubleAmount;
                        payViewModel.amount = doubleAmount;
                      } on FormatException {
                        var snackBar = const SnackBar(
                          content: Text("invalid amount"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }
                      Navigator.of(context).pushNamed('/scan_to_pay/summary');
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
