import 'package:flutter/material.dart';
import 'package:skip/core/utils/color_contant.dart';

class PasswordLinedTextField extends StatefulWidget {
  const PasswordLinedTextField({Key? key, required this.onChanged}) : super(key: key);
  final void Function(String) onChanged;
  @override
  State<PasswordLinedTextField> createState() => _PasswordLinedTextFieldState();
}

class _PasswordLinedTextFieldState extends State<PasswordLinedTextField> {

  bool obscureText = true;

  void toggleObscure() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextField(
              onChanged: widget.onChanged,
              obscureText: obscureText,
              // obscuringCharacter: "*",
              decoration: InputDecoration(
                  suffix: InkWell(
                      onTap: toggleObscure,
                      child: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      )),
                  hintText: "password",

                  // [enabledBorder], displayed when [TextField, InputDecoration.enabled] is true
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  //[focusedBorder], displayed when [TextField, InputDecorator.isFocused] is true
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorConstant.teal),
                  ))),
        ]));
  }
}
