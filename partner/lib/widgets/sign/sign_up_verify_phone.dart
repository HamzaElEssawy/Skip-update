import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skip/core/utils/color_contant.dart';
import 'package:skip/widgets/onboarding/utils/helper/confirmation_button.dart';
import '../../view_models/user_view_model.dart';

class SignUpVerifyPhone extends StatefulWidget {
  const SignUpVerifyPhone({Key? key}) : super(key: key);

  @override
  State<SignUpVerifyPhone> createState() => _SignUpVerifyPhoneState();
}

class _SignUpVerifyPhoneState extends State<SignUpVerifyPhone> {
  String code = "";

  @override
  Widget build(BuildContext context) {
    var userViewModel = context.read<UserViewModel>();

    return Scaffold(
      body: Container(
          color: ColorConstant.darkBlueBackground,
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
                    'Verify Phone',
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
                  text: TextSpan(
                      text: 'Enter the code sent to ',
                      style: const TextStyle(
                          color: Colors.white, height: 1.4, fontSize: 20),
                      children: <TextSpan>[
                    TextSpan(
                        text:
                            '+${userViewModel.country.dialCode}-${userViewModel.mobile}',
                        style: const TextStyle(
                            color: Colors.orange, height: 1.4, fontSize: 20))
                  ])),
              const SizedBox(
                height: 40,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 100, right: 100),
                  child: TextField(
                      onChanged: (text) => setState(() {
                                              code = text;
                                            }),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          hintText: "code",
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorConstant.teal, width: 3),
                          )))),
              const SizedBox(
                height: 40,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Didn’t receive any code? ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        height: 1.4,
                        fontSize: 16,
                        fontFamily: "DM Sans",
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Resend Code',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: ColorConstant.teal,
                            height: 1.4,
                            fontSize: 17,
                            fontFamily: "DM Sans",
                          ),
                        )),
                  ]),
              const SizedBox(
                height: 30,
              ),
              ConfirmationButton(
                  text: "Continue",
                  margin: 0,
                  callback: () async {
                    await userViewModel.codeResponse(code);
                    if (userViewModel.isSuccessfulCodeResponse) {
                      Navigator.of(context).pushNamed('/sign/up/biometric');
                    } else {
                      var snackBar = SnackBar(
                        content:
                            Text(userViewModel.apiResponse.body.toString()),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }
                  }),
              const SizedBox(height: 30),
              IconButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed('/sign/up/biometric'),
                  icon: const Icon(Icons.arrow_forward))
            ],
          )),
    );
  }
}
