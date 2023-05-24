import 'package:flutter/material.dart';
import 'package:skip/core/utils/color_contant.dart';

class DescribedText extends StatelessWidget {
  const DescribedText(
      {Key? key, required this.textTitle, required this.textDescription})
      : super(key: key);
  final String textTitle;
  final String textDescription;

  @override
  Widget build(BuildContext context) {
    return (Container(
      // width: 343,
      padding: const EdgeInsets.only(left: 35, right: 35),
      // height: 104,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            textTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorConstant.blackText,
              fontSize: 28,
              fontFamily: "DM Sans",
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            // height: 60,
            child: Text(
              textDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorConstant.greyText,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

