import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:skip/core/utils/color_contant.dart';
import 'package:skip/view_models/user_view_model.dart';
import 'package:skip/widgets/onboarding/utils/helper/confirmation_button.dart';
import 'package:skip/widgets/sign/utils/lined_textfield.dart';
import 'package:skip/widgets/sign/utils/password_lined_textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    var userViewModel = context.read<UserViewModel>();

    return Scaffold(
        body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(
                parent: NeverScrollableScrollPhysics()),
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: Column(children: <Widget>[
              const SizedBox(
                height: 70,
              ),
              Image.asset('assets/skip-small.png'),
              const SizedBox(
                height: 30,
              ),
              IntlPhoneField(
                disableLengthCheck : true,
                decoration: const InputDecoration(
                    hintText: "mobile",
                    hintStyle: TextStyle(color: Colors.grey),
                    errorStyle: TextStyle(color: Colors.orangeAccent),
                    focusedBorder:
                        UnderlineInputBorder(borderSide: BorderSide(width: .5)),
                    enabledBorder:
                        UnderlineInputBorder(borderSide: BorderSide(width: .5)),
                    errorBorder:
                        UnderlineInputBorder(borderSide: BorderSide(width: .5)),
                    focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: .5))),
                onChanged: (phone) {
                  userViewModel.mobile = phone.number.trim().replaceAll(" ", "");
                },
                onCountryChanged: (country) {
                  userViewModel.country = country;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              LinedTextField(
                field: "Name",
                callback: (text) => userViewModel.name = text,
              ),
              const SizedBox(
                height: 10,
              ),
              LinedTextField(
                field: "Email",
                callback: (text) => userViewModel.email = text,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      'SignUp Password',
                      style: TextStyle(
                          height: 1.4,
                          fontSize: 20,
                          fontFamily: "DM Sans",
                          color: ColorConstant.darkBlueBackground,
                          fontWeight: FontWeight.w700),
                    )
                  ]),
              PasswordLinedTextField(
                onChanged: (text) => userViewModel.password = text,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      'Must be at least 8 characters',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        height: 1.4,
                        fontSize: 16,
                        fontFamily: "DM Sans",
                      ),
                    ),
                  ]),
              const SizedBox(
                height: 40,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    Flexible(
                        child: Text(
                      'By creating an account, you accept our terms',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        height: 1.4,
                        fontSize: 14,
                        fontFamily: "DM Sans",
                      ),
                    )),
                  ]),
              const SizedBox(
                height: 20,
              ),
              ConfirmationButton(
                  text: "Continue",
                  margin: 0,
                  callback: () {
                    if (userViewModel.password.length < 8 ||
                        userViewModel.mobile.isEmpty ||
                        userViewModel.name.isEmpty) {
                      var snackBar = const SnackBar(
                        content: Text('enter valid mobile, name and password'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }
                    Navigator.of(context).pushNamed("/sign/up/phone");
                  }),
            ])));
  }
}
