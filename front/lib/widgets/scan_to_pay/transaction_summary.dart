import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skip/core/utils/color_contant.dart';
import 'package:skip/view_models/pay_view_model.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

class TransactionSummary extends StatefulWidget {
  const TransactionSummary({Key? key}) : super(key: key);

  @override
  State<TransactionSummary> createState() => _TransactionSummaryState();
}

class _TransactionSummaryState extends State<TransactionSummary> {
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
                      'Transaction Summary',
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
                const SizedBox(
                  height: 30,
                ),
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
                          : Image.asset('assets/scan_to_pay/default-small.jpg'),
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
                  )
                ]),
                const SizedBox(
                  height: 30,
                ),
                Consumer<PayViewModel>(
                  builder: (context, payModel, child) {
                    return Text(
                      "EGP" + (payModel.amount + 10).toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontFamily: "Barlow",
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(alignment: Alignment.center, children: [
                  Opacity(
                    opacity: 0.10,
                    child: Container(
                      // width: 343,
                      height: 52,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    children: const <Widget>[
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Payment fee of EGP10 has been applied',
                        style: TextStyle(
                            color: Colors.white, height: 1.4, fontSize: 14),
                      ),
                    ],
                  ),
                ])
              ]),
              ConfirmationSlider(
                  text: 'slide to pay',
                  foregroundColor: ColorConstant.teal,
                  onConfirmation: () {
                    Navigator.of(context)
                        .pushNamed('/scan_to_pay/password_confirmation');
                  }),
              const SizedBox(
                height: 40,
              )
            ],
          )),
    );
  }

  String getNowFormatedDate() {
    DateTime now = DateTime.now();
    DateFormat format = DateFormat('MMM dd, yyyy');
    return format.format(now);
  }
}
