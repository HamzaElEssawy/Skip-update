import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:skip/core/utils/color_contant.dart';
import '../../view_models/user_view_model.dart';

class MyQrcode extends StatelessWidget {
  const MyQrcode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userViewModel = context.read<UserViewModel>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          color: ColorConstant.darkBlueBackground,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => {Navigator.of(context).pop()},
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 50,
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'My QrCode',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        height: 1.4,
                        fontSize: 24),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: QrImage(
                  padding: const EdgeInsets.all(20),
                  backgroundColor: Colors.white,
                  data:
                      '${userViewModel.id},${userViewModel.name}',
                  version: QrVersions.auto,
                  size: 300,
                  gapless: false,
                ),
              ),
            ],
          )),
    );
  }
}
