import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skip/core/utils/color_contant.dart';
import 'package:skip/view_models/pay_view_model.dart';
import 'package:skip/widgets/home/utils/icon_text_button.dart';
import 'package:skip/widgets/home/utils/icon_button_with_text.dart';

import '../../view_models/user_view_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final imagesUrls = [
    'assets/home/promo-card-1.png',
    'assets/home/promo-card-2.png',
  ];


  @override
  Widget build(BuildContext context) {
    var userViewModel = context.read<UserViewModel>();

    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.only(left: 35, right: 35, top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/skip-small-logo.png'),
                        IconButton(
                            onPressed: () => {},
                            icon: const Icon(Icons.settings_outlined))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Hello, ${userViewModel.name}',
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    color: ColorConstant.darkBlueBackground,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                            const Text('Your available balance',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 14)),
                          ],
                        ),
                        Text('EGP${userViewModel.balance}',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: ColorConstant.darkBlueBackground,
                                fontWeight: FontWeight.w700,
                                fontFamily: "DM Sans",
                                fontSize: 28)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                        // color: ColorConstant.teal,
                        padding: const EdgeInsets.all(13),
                        decoration: const BoxDecoration(
                            color: ColorConstant.teal,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            )),
                        child: IntrinsicHeight(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconTextButton(
                                icon: Icons.currency_exchange_outlined,
                                text: 'Tranfer',
                                callback: () => Navigator.of(context).pushNamed('/transfer')),
                            const VerticalDivider(
                                color: Colors.white54, thickness: 2),
                            IconTextButton(
                                icon: Icons.qr_code_sharp, text: 'Scan to Pay',
                                callback: () => Navigator.of(context).pushNamed('/scan_to_pay')),
                            const VerticalDivider(
                                color: Colors.white54, thickness: 2),
                            IconTextButton(
                                icon: Icons.account_balance_wallet_outlined,
                                text: 'Top Up',
                                callback: () => Navigator.of(context).pushNamed('/top_up')),
                          ],
                        ))),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButtonWithText(
                            icon: FontAwesomeIcons.boltLightning,
                            color: Colors.orangeAccent,
                            text: 'Utilities',
                            callback: () => Navigator.of(context).pushNamed('/home/utilities')),
                        IconButtonWithText(
                            icon: FontAwesomeIcons.tags,
                            color: Colors.greenAccent,
                            text: 'Offers',
                            callback: (){},),
                        IconButtonWithText(
                            icon: FontAwesomeIcons.boltLightning,
                            color: Colors.deepOrangeAccent,
                            text: 'Activity',
                            callback: () => Navigator.of(context).pushNamed('/home/activity')),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButtonWithText(
                            icon: FontAwesomeIcons.cartShopping,
                            color: Colors.greenAccent,
                            text: 'Shop',
                            callback: () => Navigator.of(context).pushNamed('/home/shop')),
                        IconButtonWithText(
                            icon: FontAwesomeIcons.receipt,
                            color: Colors.lightBlue,
                            text: 'Mobile Credit',
                            callback: () => Navigator.of(context).pushNamed('/home/mobile_credit')),
                        IconButtonWithText(
                            icon: FontAwesomeIcons.shareNodes,
                            color: Colors.lightGreen,
                            text: 'Split Bill',
                            callback: (){},),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Promo & Discount",
                          style: TextStyle(
                            color: ColorConstant.darkBlueBackground,
                            fontSize: 18,
                            fontFamily: "DM Sans",
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    const SizedBox(height: 20,),
                    CarouselSlider.builder(
                        itemCount: 2,
                        // options: CarouselOptions(),
                          options: CarouselOptions(
                              enlargeCenterPage: false,
                              height: 170/1.3,
                              aspectRatio: 318 / 170,
                              enlargeStrategy: CenterPageEnlargeStrategy.scale,
                              viewportFraction: 0.8 ),

                        itemBuilder: (context, index, realIndex) {
                          final itemUrl = imagesUrls[index];
                          return buildCarouselItem(itemUrl, index);
                        }),
                    const SizedBox(height: 100,)
                  ],
                ))));
  }

  Widget buildCarouselItem(String itemUrl, int index) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      color: Colors.grey,
      width: double.infinity,
      child: Image.asset(itemUrl, fit: BoxFit.cover, scale: 1.3)); // child: Image.asset(itemUrl, fit: BoxFit.fill));

}
