import 'package:flutter/material.dart';
import 'package:skip/core/utils/color_contant.dart';
import 'package:skip/widgets/onboarding/utils/buttom_modal.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen(
      {Key? key,
      required this.buttonText,
      required this.textTitle,
      required this.textDescription,
      required this.screenNumber,
      required this.callback})
      : super(key: key);
  final String buttonText;
  final String textTitle;
  final String textDescription;
  final String screenNumber;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return (Container(
      color: ColorConstant.darkBlueBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Column(
              // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 30,),
              Image.asset('assets/skip-small-white.png'),
            ],
          ),
          Column(
            children: [
              Image.asset(
                'assets/onboarding/welcome_art_$screenNumber.png',
                // scale: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/onboarding/slider_$screenNumber.png',
              ),
              const SizedBox(
                height: 15,
              ),
              BottomModal(
                buttonText: buttonText,
                textTitle: textTitle,
                textDescription: textDescription,
                callback: callback,
              )
            ],
          ),
        ],
      ),
    ));
  }
}
