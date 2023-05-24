import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skip/core/utils/color_contant.dart';
import 'package:skip/widgets/profile/utils/profile_inkwell.dart';

import '../../core/user_shared_preferences.dart';
import '../../view_models/user_view_model.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userViewModel = context.read<UserViewModel>();

    ImageProvider<Object> imageProvider  = const AssetImage('assets/scan_to_pay/default.jpg');
    if(userViewModel.imageUrlExists){
      imageProvider = NetworkImage(userViewModel.imageUrl);
    }

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
                children: const [
                  Text(
                    'My Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "DM Sans",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Icon(Icons.qr_code_sharp, color: Colors.white),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 100,
                    height: 160,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: imageProvider
                        )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userViewModel.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: "DM Sans",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        userViewModel.mobile,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 16,
                          fontFamily: "DM Sans",
                        ),
                      ),
                      Text(
                        userViewModel.email,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: "DM Sans",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Image.asset('assets/home/bank-card-3.png'),
                  Image.asset('assets/home/bank-card-1.png'),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ProfileInkWell(icon: Icons.person, callback: () {}, text: 'Personal'),
        const SizedBox(
          height: 20,
        ),
        ProfileInkWell(
            icon: Icons.lock, callback: () {}, text: 'Privacy & Security'),
        const SizedBox(
          height: 20,
        ),
        ProfileInkWell(
            icon: FontAwesomeIcons.gift,
            callback: () {},
            text: 'Offers & Rewards'),
        const SizedBox(
          height: 20,
        ),
        ProfileInkWell(icon: Icons.help, callback: () {}, text: 'Help'),
        const SizedBox(
          height: 20,
        ),
        ProfileInkWell(icon: Icons.logout, 
            callback: () async {
              await UserSharedPreferences.clearAllData();
              Navigator.of(context).pushNamedAndRemoveUntil(
                                '/onboarding', (Route<dynamic> route) => false);
            },
            text: 'Logout'),
                      const SizedBox(height: 75,),
      ],
    )));
  }
}
