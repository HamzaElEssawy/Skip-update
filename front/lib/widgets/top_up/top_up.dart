import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skip/core/utils/color_contant.dart';
import 'package:skip/widgets/onboarding/utils/helper/confirmation_button.dart';

class TopUp extends StatelessWidget {
  const TopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 35, right: 35),
          decoration: const BoxDecoration(
              color: ColorConstant.darkBlueBackground,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => {Navigator.of(context).pop()},
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 40,
                      )),
                  const Text(
                    'Top Up With Credit Card',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "DM Sans",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Credit Card",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "DM Sans",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Choose your credit card",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    // child: Icon(FontAwesomeIcons.plus), color: Colors.white,)
                    child: const Icon(FontAwesomeIcons.plus),
                  ),
                )
              ]),
              const SizedBox(
                height: 30,
              ),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Image.asset('assets/home/bank-card-3.png'),
                  Image.asset('assets/home/bank-card-1.png'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 30,),
        Container(
            padding: EdgeInsets.all(10),
            child: 
        Image.asset('assets/top_up/coming-soon.png'),
        ),
        const Text(
          "TBD",
          style: TextStyle(
            color: ColorConstant.darkBlueBackground,
            fontSize: 100,
            fontFamily: "DM Sans",
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 30,),
        ConfirmationButton(text: "Top Up Now", margin: 35, callback: () {}),
      ],
    )));
  }
}
