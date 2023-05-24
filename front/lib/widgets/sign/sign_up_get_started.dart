import 'package:flutter/material.dart';
import 'package:skip/core/utils/color_contant.dart';
import 'package:skip/widgets/onboarding/utils/helper/confirmation_button.dart';
import 'package:skip/widgets/root.dart';

class SignUpGetStarted extends StatefulWidget {
  const SignUpGetStarted({Key? key}) : super(key: key);

  @override
  State<SignUpGetStarted> createState() => _SignUpGetStartedState();
}

class _SignUpGetStartedState extends State<SignUpGetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: ColorConstant.darkBlueBackground,
          // color: Colors.green,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset('assets/sign/get_started.png'),
              const SizedBox(
                height: 100,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome to SKIP Pay",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: "DM Sans",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 40,
                    child: Text(
                      "Voila! You have successfuly created your account.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              ConfirmationButton(
                  text: "Continue",
                  margin: 0,
                  // callback: () => Navigator.of(context).pushNamed('/')),

        callback: () => Navigator.of(context).pushNamedAndRemoveUntil(
            '/',
            (Route<dynamic> route) => false)),
              const SizedBox(
                height: 40,
              )
            ],
          )),
    );
  }
}
