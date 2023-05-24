import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skip/core/utils/color_contant.dart';

class Notifications extends StatelessWidget {
  Notifications({Key? key}) : super(key: key);

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
                          onPressed: () => {},
                          // onPressed: () => {Navigator.of(context).pop()},
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 40,
                          )),
                      const Text(
                        'Notifications',
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
                      const SizedBox(height: 20,),
                      Image.asset('assets/notifications/today.png'),
                      const SizedBox(height: 20,),
                      Image.asset('assets/notifications/yesterday.png',),
                      const SizedBox(height: 70,),
                    ],
                  )),
            ],
          ))),
    );
  }

}
