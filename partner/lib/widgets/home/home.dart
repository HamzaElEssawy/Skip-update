import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skip/core/utils/color_contant.dart';
import 'package:skip/widgets/home/utils/icon_text_button.dart';

import '../../view_models/user_view_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var userViewModel = context.read<UserViewModel>();

    final itemsUrls1 = [
      [
        'assets/activity/starbucks-logo.png',
        'Starbucks coffee',
        '2 Mar 2022 - 3:09 PM',
        'EGP60.00'
      ],
      [
        'assets/activity/starbucks-logo.png',
        'Starbucks coffee',
        '2 Apr 2022 - 5:19 PM',
        'EGP45.00'
      ],
      [
        'assets/activity/starbucks-logo.png',
        'Starbucks coffee',
        '2 May 2022 - 1:43 PM',
        'EGP145.00'
      ],
    ];

    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(left: 35, right: 35, top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
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
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image.asset('assets/partner/starbucks.png'),
                    const SizedBox(height: 10),
                    const Text('Starbucks',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: ColorConstant.darkBlueBackground,
                            fontWeight: FontWeight.w400,
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
                            icon: Icons.leaderboard,
                            text: 'Dashboard',
                            callback: () => {}),
                        const VerticalDivider(
                            color: Colors.white54, thickness: 2),
                        IconTextButton(
                            icon: Icons.qr_code_sharp,
                            text: 'Merchant QR',
                            callback: () => Navigator.of(context).pushNamed('/home/my_qrcode')),
                        const VerticalDivider(
                            color: Colors.white54, thickness: 2),
                        IconTextButton(
                            icon: Icons.account_balance_wallet_outlined,
                            text: 'Withdraw',
                            callback: () => {}),
                      ],
                    ))),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    // alignment: AlignmentDirectional.center,
                    margin: const EdgeInsets.only(left: 60, right: 60),
                    // color: ColorConstant.teal,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: ColorConstant.teal,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        )),
                    child: InkWell(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Text('Generate QR',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "DM Sans",
                                    fontSize: 23)),
                            VerticalDivider(color: Colors.white, thickness: 2),
                            Icon(
                              Icons.crop_free_rounded,
                              color: Colors.white,
                            ),
                          ]),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('/generate_qr');
                      },
                    )),
                const SizedBox(height: 20),
                const Text(
                  'Transactions',
                  style: TextStyle(
                      color: ColorConstant.darkBlueBackground,
                      fontWeight: FontWeight.w700,
                      height: 1.4,
                      fontSize: 24),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: SingleChildScrollView(
                        child: Column(
                  children: [
                    for (var i in [
                      ...itemsUrls1,
                      ...itemsUrls1,
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
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ))),
              ],
            )));
  }
}
