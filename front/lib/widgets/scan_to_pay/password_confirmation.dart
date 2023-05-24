import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skip/view_models/pay_view_model.dart';
import 'package:skip/widgets/onboarding/utils/helper/confirmation_button.dart';
import 'package:skip/widgets/sign/utils/password_lined_textfield.dart';

import '../../core/utils/color_contant.dart';
import '../../repos/api_status.dart';
import '../../view_models/user_view_model.dart';

class PasswordConfirmation extends StatefulWidget {
  const PasswordConfirmation({Key? key}) : super(key: key);

  @override
  State<PasswordConfirmation> createState() => _PasswordConfirmationState();
}

class _PasswordConfirmationState extends State<PasswordConfirmation> {
  String mobile = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    var userViewModel = context.read<UserViewModel>();
    var payViewModel = context.read<PayViewModel>();

    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: Column(children: <Widget>[
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
                        color: ColorConstant.darkBlueBackground,
                        size: 50,
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Confirm with Password',
                    style: TextStyle(
                        color: ColorConstant.darkBlueBackground,
                        fontWeight: FontWeight.w700,
                        height: 1.4,
                        fontSize: 24),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Text('Please input your password before continuing payment',
                  style: TextStyle(
                      color: Colors.grey, fontSize: 18, fontFamily: 'DM Sans')),
              const SizedBox(
                height: 30,
              ),
              PasswordLinedTextField(
                onChanged: (pass) {
                  setState(() {
                    password = pass;
                  });
                },
              ),
              const SizedBox(
                height: 150,
              ),
              ConfirmationButton(
                  text: "Confirm with Password",
                  margin: 0,
                  callback: () async {
                    if (!userViewModel.isValidPassword(password)) {
                      var snackBar = const SnackBar(
                        content: Text('Invalid password'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }
                    var response = await payViewModel.pay(userViewModel.token);
                    if (response is Success) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/scan_to_pay/receipt',
                          (Route<dynamic> route) => false);
                    }
                    if (response is Failure) {
                      var snackBar = SnackBar(
                        content: Text(response.body),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }
                  }
                  // {
                  //   if (userViewModel.isValidPassword(password)) {
                  //     Navigator.of(context).pushNamedAndRemoveUntil(
                  //         '/scan_to_pay/receipt',
                  //         (Route<dynamic> route) => false);
                  //   } else {
                  //     var snackBar = const SnackBar(
                  //       content:
                  //           Text('Invalid password'),
                  //     );
                  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  //     return;
                  //   }
                  // }
                  ),
            ])));
  }
}
