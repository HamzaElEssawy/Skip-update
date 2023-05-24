import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skip/core/utils/color_contant.dart';
import 'package:skip/view_models/pay_view_model.dart';
import 'package:skip/view_models/user_view_model.dart';
import 'package:skip/routes/route_generator.dart';

import 'core/user_shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserSharedPreferences.init();

  runApp(const SkipApp());
}

class SkipApp extends StatelessWidget {
  const SkipApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool signInState = UserSharedPreferences.getSign() ?? false;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PayViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        title: 'SKIP',
        theme: ThemeData(
          primarySwatch:
              ColorConstant.generateMaterialColorFromColor(ColorConstant.teal),
        ),
        initialRoute: signInState ? '/' : '/onboarding',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
