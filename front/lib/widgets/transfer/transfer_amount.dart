import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skip/core/utils/color_contant.dart';
import 'package:skip/models/app_contact.dart';
import 'package:skip/view_models/pay_view_model.dart';
import 'package:skip/widgets/onboarding/utils/helper/confirmation_button.dart';
import 'package:skip/widgets/transfer/search_modal.dart';

class TransferAmount extends StatefulWidget {
  const TransferAmount({Key? key}) : super(key: key);

  @override
  State<TransferAmount> createState() => _TransferAmountState();
}

class _TransferAmountState extends State<TransferAmount> {
  AppContact? chosenContact;
  String amount = "";

  @override
  void initState() {
    super.initState();
    context.read<PayViewModel>().clearReceiverData();
  }

  @override
  Widget build(BuildContext context) {
    var payViewModel = context.watch<PayViewModel>();

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
              child: Row(
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
                    'Transfer with Skip',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "DM Sans",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                      padding: EdgeInsets.zero,
                      // onPressed: () => {Navigator.of(context).pop()},
                      onPressed: () => buildShowModalBottomSheet(context),
                      icon: const Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: Colors.white,
                        size: 25,
                      )),
                  // SearchPageButton()
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Contact",
                            style: TextStyle(
                              color: ColorConstant.darkBlueBackground,
                              fontSize: 18,
                              fontFamily: "DM Sans",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          // Image.asset('assets/transfer/recent-contacts.png'),
                          Container(
                              padding: const EdgeInsets.all(15),
                              height: 150,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  color: ColorConstant.greyBackGround,
                                  borderRadius: BorderRadius.circular(20)),
                              // child: Text('elsalamo 3aleko'),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Chosen Contact",
                                        style: TextStyle(
                                          color:
                                              ColorConstant.darkBlueBackground,
                                          fontSize: 18,
                                          fontFamily: "DM Sans",
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            buildShowModalBottomSheet(context),
                                        child: const Text(
                                          "see all contacts",
                                          style: TextStyle(
                                            color: ColorConstant.teal,
                                            fontSize: 13,
                                            fontFamily: "DM Sans",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  (payViewModel.receiverPhone.isEmpty)
                                      ? const SizedBox(
                                          height: 50,
                                          child: Center(
                                            child: Text(
                                                'You still have not chosen a contact'),
                                          ))
                                      : ListTile(
                                          title:
                                              Text(payViewModel.receiverName),
                                          subtitle:
                                              Text(payViewModel.receiverPhone),
                                          leading: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              child: ClipRect(
                                                child: payViewModel
                                                        .receiverImageUrlExists
                                                    ? Image.network(payViewModel
                                                        .receiverImageUrl)
                                                    : Image.asset(
                                                        'assets/scan_to_pay/default-small.jpg'),
                                                // child: Image.network(
                                                //   payViewModel.receiverImageUrl,
                                                //   fit: BoxFit.cover,
                                                // ),
                                              ))),
                                ],
                              )),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            "Set amount",
                            style: TextStyle(
                              color: ColorConstant.darkBlueBackground,
                              fontSize: 18,
                              fontFamily: "DM Sans",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "How much would you like to transfer?",
                            style: TextStyle(
                              color: ColorConstant.darkBlueBackground
                                  .withOpacity(0.7),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: SizedBox(
                              width: 80,
                              child: TextField(
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.black),
                                  onChanged: (amount) {
                                    this.amount = amount;
                                  },
                                  decoration: const InputDecoration(
                                      hintText: "amount",
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.teal, width: 2),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorConstant
                                                .darkBlueBackground,
                                            width: 3),
                                      ))),
                            ),
                          ),
                          // LinedTextField(field: 'amount', callback: (am) {setState(() {
                          //                             amount = am;
                          //                           });}),
                        ],
                      ),
                      Column(
                        children: [
                          ConfirmationButton(
                              text: 'Continue',
                              margin: 35,
                              callback: () {
                                if (amount.isNotEmpty) {
                                  try {
                                    double doubleAmount = double.parse(amount);
                                    payViewModel.amount = doubleAmount;
                                  } on FormatException {
                                    var snackBar = const SnackBar(
                                      content: Text("invalid amount"),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    return;
                                  }
                                  if (payViewModel.receiverPhone.isEmpty) {
                                    var snackBar = const SnackBar(
                                      content: Text(
                                          "you have to choose a skip user"),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    return;
                                  }
                                  Navigator.of(context)
                                      .pushNamed('/transfer/confirm');
                                }
                              }),
                          const SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    ],
                  )),
            )
          ],
        ));
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (context) => const SearchModal());
  }
}
