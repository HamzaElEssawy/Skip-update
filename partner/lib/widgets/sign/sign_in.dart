import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skip/core/utils/color_contant.dart';
import 'package:skip/widgets/onboarding/utils/helper/confirmation_button.dart';
import 'package:skip/widgets/sign/utils/lined_textfield.dart';
import 'package:skip/widgets/sign/utils/password_lined_textfield.dart';

import '../../view_models/user_view_model.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String mobile = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    var userViewModel = context.read<UserViewModel>();

    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: Column(children: <Widget>[
              const SizedBox(
                height: 70,
              ),
              Image.asset('assets/skip-small.png'),
              const SizedBox(
                height: 30,
              ),
              LinedTextField(
                field: "mobile",
                callback: (text) => userViewModel.mobile = text,
              ),
              const SizedBox(
                height: 10,
              ),
              PasswordLinedTextField(
                onChanged: (text) => userViewModel.password = text,
              ),
              const SizedBox(
                height: 40,
              ),
              ConfirmationButton(
                  text: "Login",
                  margin: 0,
                  callback: () async {
                    await userViewModel.signIn();
                    if (userViewModel.isSuccessfulSignInResponse) {
                      // Navigator.of(context).pushNamed('/sign/up/get_started');
                      Navigator.of(context).pushNamedAndRemoveUntil(
                                        '/', (Route<dynamic> route) => false);
                    } else {
                      var snackBar = SnackBar(
                        content:
                            Text(userViewModel.apiResponse.body.toString()),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }
                  }),
              const SizedBox(
                height: 40,
              ),
              // Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       const Text(
              //         'New to Skip?',
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //           color: Colors.grey,
              //           height: 1.4,
              //           fontSize: 16,
              //           fontFamily: "DM Sans",
              //         ),
              //       ),
              //       TextButton(
              //           onPressed: () {
              //             Navigator.of(context).pushNamed('/sign/up');
              //           },
              //           child: const Text(
              //             'Sign Up',
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //               decoration: TextDecoration.underline,
              //               color: ColorConstant.darkBlueBackground,
              //               height: 1.4,
              //               fontSize: 17,
              //               fontFamily: "DM Sans",
              //             ),
              //           )),
              //     ])
            ])));
  }
}
