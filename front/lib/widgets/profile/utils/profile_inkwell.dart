import 'package:flutter/material.dart';
import '../../../core/utils/color_contant.dart';

class ProfileInkWell extends StatelessWidget {
  const ProfileInkWell({
    Key? key,
    required this.icon,
    required this.callback,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback callback;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: callback,
        child: Container(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          icon,
                          color: ColorConstant.teal,
                          size: 40,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          text,
                          style: const TextStyle(
                            color: ColorConstant.darkBlueBackground,
                            fontSize: 16,
                            fontFamily: "DM Sans",
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey.withOpacity(0.7),
                      size: 35,
                    ),
                  ],
                )
              ],
            )));
  }
}
