import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:skip/core/utils/color_contant.dart';
import 'package:skip/widgets/onboarding/utils/helper/confirmation_button.dart';
import '../../view_models/user_view_model.dart';

class SignUpPhone extends StatelessWidget {
  const SignUpPhone({Key? key}) : super(key: key);

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
                    'Continue with Phone',
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
                'Confirm your phone number to receive a pin code to sign up.',
                style:
                    TextStyle(color: Colors.white, height: 1.4, fontSize: 20),
              ),
              const SizedBox(
                height: 40,
              ),
              IntlPhoneField(
                enabled: false,
                showDropdownIcon: false,
                initialCountryCode: userViewModel.country.code,
                initialValue: userViewModel.mobile,
                style: const TextStyle(color: Colors.white),
                dropdownTextStyle: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                    hintText: "mobile",
                    labelStyle: TextStyle(color: Colors.white),
                    helperStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.grey),
                    errorStyle: TextStyle(color: Colors.orangeAccent),
                    prefixStyle: TextStyle(color: Colors.white),
                    suffixStyle: TextStyle(color: Colors.white),
                    floatingLabelStyle: TextStyle(color: Colors.white),
                    counterStyle: TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: .5)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: .5)),
                    errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: .5)),
                    focusedErrorBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: .5))),
              ),
              const SizedBox(
                height: 50,
              ),
              ConfirmationButton(
                  text: "Send Code",
                  margin: 0,
                  callback: () async {
                    await userViewModel.checkPhone();
                    if (userViewModel.isSuccessfulCheckPhone) {
                      Navigator.of(context).pushNamed('/sign/up/verify_phone');
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
                      .pushNamed('/sign/up/verify_phone'),
                  icon: const Icon(Icons.arrow_forward))
            ],
          )),
    );
  }
}
