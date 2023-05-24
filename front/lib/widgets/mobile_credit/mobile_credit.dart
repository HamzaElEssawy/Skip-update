import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skip/core/utils/color_contant.dart';

class MobileCredit extends StatelessWidget {
  MobileCredit({Key? key}) : super(key: key);

  final itemsUrls = [
    'assets/mobile_credit/vodafone.jpg',
    'assets/mobile_credit/we.jpg',
    'assets/mobile_credit/orange.jpg',
  ];

  final itemsUrls1 = [
    [
      'assets/mobile_credit/vodafone-logo.jpg',
      'Vodafone bill',
      '2 Dec 2020 - 3:09 PM',
      '-EGP45.00'
    ],
    [
      'assets/mobile_credit/we-logo.jpg',
      'We bill',
      '2 Dec 2020 - 3:09 PM',
      '-EGP70.00'
    ],
    [
      'assets/mobile_credit/orange-logo.jpg',
      'Orange bill',
      '1 Dec 2020 - 5:09 PM',
      '-EGP50.00'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: ColorConstant.darkBlueBackground,
          // color: Colors.green,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 70,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => {Navigator.of(context).pop()},
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 40,
                          )),
                      const Text(
                        'Mobile Credit',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            height: 1.4,
                            fontSize: 24),
                      ),
                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => {},
                          icon: const Icon(
                            FontAwesomeIcons.sliders,
                            color: Colors.white,
                            size: 25,
                          )),
                    ],
                  )),
              const SizedBox(
                height: 30,
              ),
              Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 8,
                    left: 35,
                    right: 35,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Spendings',
                        style: TextStyle(
                            color: ColorConstant.darkBlueBackground,
                            fontWeight: FontWeight.w700,
                            height: 1.4,
                            fontSize: 24),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CarouselSlider.builder(
                          itemCount: 3,
                          options: CarouselOptions(
                              enlargeCenterPage: false,
                              height: 150,
                              aspectRatio: 140 / 92,
                              enlargeStrategy: CenterPageEnlargeStrategy.scale,
                              viewportFraction: 0.5),
                          itemBuilder: (context, index, realIndex) {
                            final itemUrl = itemsUrls[index];
                            return buildCarouselItem(itemUrl, index);
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset('assets/activity/warning.png'),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Expenses',
                        style: TextStyle(
                            color: ColorConstant.darkBlueBackground,
                            fontWeight: FontWeight.w700,
                            height: 1.4,
                            fontSize: 24),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          for (var i in [
                            ...itemsUrls1,
                            ...itemsUrls1,
                            ...itemsUrls1
                          ]) ...[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(child: Image.asset(i[0])),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      i[1],
                                      style: const TextStyle(
                                          color:
                                              ColorConstant.darkBlueBackground,
                                          fontWeight: FontWeight.w700,
                                          height: 1.4,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      i[2],
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          height: 1.4,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                Text(
                                  i[3],
                                  style: const TextStyle(
                                      color: ColorConstant.darkBlueBackground,
                                      height: 1.4,
                                      fontFamily: "DM Sans",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Divider(
                              color: Colors.grey.withOpacity(0.6),
                            ),
                          ],
                        ],
                      ),
                    ],
                  )),
            ],
          ))),
    );
  }

  Widget buildCarouselItem(String itemUrl, int index) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      color: Colors.black87,
      width: double.infinity,
      child: Image.asset(itemUrl, fit: BoxFit.fill));
}
