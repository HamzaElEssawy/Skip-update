import 'package:flutter/material.dart';
import 'package:skip/core/utils/color_contant.dart';
import 'package:skip/widgets/onboarding/utils/helper/confirmation_button.dart';

class SignIllustrations extends StatelessWidget {
  const SignIllustrations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.darkBlueBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Image.asset(
            'assets/sign/sign_illustrations.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(height: 46),
          const SizedBox(
            height: 78,
            child: Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  'A new way to pay anything more faster',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    height: 1.4,
                    fontSize: 28,
                    fontFamily: "DM Sans",
                    fontWeight: FontWeight.w700,
                  ),
                )),
          ),
          const SizedBox(
            height: 46,
          ),
          ConfirmationButton(callback: () => {}, margin: 35, text: 'Login'),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Sign Up",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              height: 1.4,
              fontSize: 16,
              fontFamily: "DM Sans",
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 38,
          )
        ],
      ),
    );
  }
}
