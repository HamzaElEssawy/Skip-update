import 'package:flutter/material.dart';
import 'package:skip/widgets/onboarding/utils/helper/confirmation_button.dart';
import 'package:skip/widgets/onboarding/utils/helper/described_text.dart';

class BottomModal extends StatelessWidget {
  const BottomModal(
      {Key? key,
      required this.buttonText,
      required this.textTitle,
      required this.textDescription,
      required this.callback})
      : super(key: key);
  final String buttonText;
  final String textTitle;
  final String textDescription;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return (Container(
      // height: MediaQuery.of(context).size.height / 2.5,
      // height: 267,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DescribedText(textTitle: textTitle, textDescription: textDescription),
          const SizedBox(height: 30),
          ConfirmationButton(
            text: buttonText,
            margin: 30,
            callback: callback,
          ),
          const SizedBox(height: 33.50),
        ],
      ),
    ));
  }
}
