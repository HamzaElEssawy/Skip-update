import 'package:flutter/material.dart';
import 'package:skip/widgets/onboarding/utils/onboarding_screen.dart';
import 'package:skip/widgets/sign/sign_in.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _screenNumber = 1;

  static List<String> titleTexts = [
    'Fastest Payment',
    'Safest Platform',
    'Receive Payments'
  ];

  static List<String> titleTextDescriptions = [
    'QR code scanning technology makes your payment process more faster',
    'Multiple verification and face ID makes your account more safely',
    'Accept payments from customers without complications'
  ];

  static List<String> buttonTexts = ['Next', 'Next', 'Get Started'];

  void incrementScreenNumber() {
    setState(() {
      if (_screenNumber < 3) {
        _screenNumber++;
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => SignIn()),
            (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingScreen(
        buttonText: buttonTexts[_screenNumber - 1],
        textTitle: titleTexts[_screenNumber - 1],
        textDescription: titleTextDescriptions[_screenNumber - 1],
        screenNumber: _screenNumber.toString(),
        callback: incrementScreenNumber,
      ),
    );
  }
}
