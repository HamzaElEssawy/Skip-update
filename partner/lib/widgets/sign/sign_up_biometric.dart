import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skip/core/utils/color_contant.dart';
import 'package:skip/widgets/onboarding/utils/helper/confirmation_button.dart';

import '../../view_models/user_view_model.dart';

class SignUpBiometric extends StatefulWidget {
  const SignUpBiometric({Key? key}) : super(key: key);

  @override
  State<SignUpBiometric> createState() => _SignUpBiometricState();
}

class _SignUpBiometricState extends State<SignUpBiometric> {
  @override
  Widget build(BuildContext context) {
    var userViewModel = context.read<UserViewModel>();

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
                      'Face ID Verification',
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
                Image.asset('assets/sign/face_detection.png'),
              ]),
              // const SizedBox(
              //   height: 40,
              // ),
              Column(
                children: <Widget>[
                  ConfirmationButton(
                      text: "Scan My Face",
                      margin: 0,
                      callback: () async {
                        await userViewModel.signUp();
                        if (userViewModel.isSuccessfulSignUpResponse) {
                          Navigator.of(context)
                              .pushNamed('/sign/up/get_started');
                        } else {
                          var snackBar = SnackBar(
                            content: Text(
                                userViewModel.apiResponse.body.toString()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          return;
                        }
                      }),
                  const SizedBox(
                    height: 40,
                  )
                ],
              )
            ],
          )),
    );
  }
}
