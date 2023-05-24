import 'package:flutter/material.dart';
import 'package:skip/core/utils/color_contant.dart';

class LinedTextField extends StatelessWidget {
  // const LinedTextField({Key? key, required this.field, required this.text})
  const LinedTextField({Key? key, required this.field, required this.callback})
      : super(key: key);

  // final String text;
  final String field;
  final void Function(String) callback;

  @override
  Widget build(BuildContext context) {
    return (Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextField(
              onChanged: callback,
              keyboardType:
                  field.toLowerCase() == 'mobile' ? TextInputType.number : null,
              onEditingComplete: () {
                print('editingcompleted');
              },
              decoration: InputDecoration(
                  hintText: field,
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
