import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({Key? key, required this.icon, required this.text, required this.callback}) : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
      onPressed: callback,
      child: Column(children: [
        Icon(icon, size: 35),
        const SizedBox(
          height: 5,
        ),
        Text(text,
            textAlign: TextAlign.start,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: "DM Sans",
                fontSize: 14)),
      ]),
    );
  }
}
