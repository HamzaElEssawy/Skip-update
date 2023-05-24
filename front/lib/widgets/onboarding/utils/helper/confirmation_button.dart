import 'package:flutter/material.dart';

class ConfirmationButton extends StatelessWidget {
  const ConfirmationButton(
      {Key? key,
      required this.text,
      required this.margin,
      required this.callback})
      : super(key: key);

  final String text;
  final double margin;
  final VoidCallback? callback;
  @override
  Widget build(BuildContext context) {
    return (Row(children: <Widget>[
      Expanded(
          child: Container(
              margin: EdgeInsets.only(left: margin, right: margin),
              // width: 200,
              // height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xff45dbcc),
              ),
              child: TextButton(
                onPressed: callback,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "DM Sans",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )))
    ]));
  }
}
