import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skip/core/utils/color_contant.dart';

class IconButtonWithText extends StatelessWidget {
  const IconButtonWithText({Key? key, required this.icon, required this.color, required this.text, required this.callback})
      : super(key: key);

  final IconData icon;
  final String text;
  final Color color;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: Colors.grey.withOpacity(0.1)),
          child: IconButton(
            onPressed: callback,
            icon: FaIcon(icon),
            color: color,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(text,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: ColorConstant.darkBlueBackground.withOpacity(0.7),
                fontFamily: "DM Sans",
                fontSize: 16)),
      ],
    );
  }
}
