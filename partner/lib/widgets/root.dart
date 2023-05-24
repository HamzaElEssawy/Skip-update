import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skip/view_models/user_view_model.dart';
import 'package:skip/widgets/home/home.dart';
import 'package:skip/widgets/notifications/notifications.dart';
import 'package:skip/widgets/profile/profile.dart';
import 'package:skip/widgets/statistics/statistics.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int index = 0;

  final screens = [
    const Home(),
    Statistics(),
    // const ScanToPay(),
    Notifications(),
    const Profile()
  ];

  final items = const <Widget>[
    Icon(Icons.home, size: 30, color: Colors.white),
    Icon(Icons.data_exploration, size: 30, color: Colors.white),
    // Icon(
    //   Icons.qr_code_2,
    //   size: 30,
    // ),
    Icon(Icons.notifications, size: 30, color: Colors.white),
    Icon(Icons.person, size: 30, color: Colors.white),
  ];

  @override
  Widget build(BuildContext context) {
    var userViewModel = context.read<UserViewModel>();
    userViewModel.reloadUserData();

    if (userViewModel.loading) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: const [CircularProgressIndicator()])
          ]);
    }


    return Scaffold(
      extendBody: true,
      bottomNavigationBar: 
          CurvedNavigationBar(
              // bottomNavigationBar: CurvedNavigationBar(
              items: items,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 200),
              backgroundColor: Colors.transparent,
              color: Colors.teal,
              onTap: (index) => setState(() {
                // index of scan to pay screen
                // print(this.index);
                // if (index == 2) {
                //   this.index = 0;
                //   Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => screens[index]),
                //   );
                //   return;
                // }
                this.index = index;
              }),
            ),
      body: screens[index],
    );
  }
}
