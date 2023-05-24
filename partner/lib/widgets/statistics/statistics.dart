import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skip/core/utils/color_contant.dart';

class Statistics extends StatelessWidget {
  Statistics({Key? key}) : super(key: key);

  final itemsUrls1 = [
    [
      'assets/activity/starbucks-logo.png',
      'Starbucks coffee',
      '2 Dec 2020 - 3:09 PM',
      '-EGP45.00'
    ],
    [
      'assets/activity/elreem-logo.png',
      'Shawerma El Reem',
      '2 Dec 2020 - 3:09 PM',
      '-EGP70.00'
    ],
    [
      'assets/activity/abou-tarek-logo.png',
      'Koshary Abou Tarek',
      '1 Dec 2020 - 5:09 PM',
      '-EGP50.00'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(left: 35, right: 35),
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
                  // padding: const EdgeInsets.only(left: 35, right: 35),
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                      padding: EdgeInsets.zero,
                      // onPressed: () => {Navigator.of(context).pop()},
                      onPressed: () => {},
                      icon: const Icon(
                        Icons.arrow_back,
                        color: ColorConstant.darkBlueBackground,
                        size: 40,
                      )),
                  const Text(
                    'Statistics',
                    style: TextStyle(
                        color: ColorConstant.darkBlueBackground,
                        fontWeight: FontWeight.w700,
                        height: 1.4,
                        fontSize: 24),
                  ),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => {},
                      icon: const Icon(
                        Icons.settings_outlined,
                        color: ColorConstant.darkBlueBackground,
                        size: 30,
                      )),
                ],
              )),
              const SizedBox(
                height: 30,
              ),
              Image.asset('assets/statistics/blue-card.png'),
              const SizedBox(
                height: 20,
              ),
              Image.asset('assets/statistics/chart.png'),
              const SizedBox(
                height: 20,
              ),
              Image.asset('assets/statistics/segmented-bar.png'),
              const SizedBox(
                height: 20,
              ),
              Image.asset('assets/statistics/category-chart.png'),
              const SizedBox(
                height: 20,
              ),
                      const Text(
                        'Recent Expenses',
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
                        Image.asset(i[0]),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              i[1],
                              style: const TextStyle(
                                  color: ColorConstant.darkBlueBackground,
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
                    const SizedBox(
                      height: 2,
                    ),
                  ],
                      const SizedBox(height: 70,),
                ],
              ),
            ],
          ))),
    );
  }
}
