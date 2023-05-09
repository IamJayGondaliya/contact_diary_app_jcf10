import 'dart:async';

import 'package:contact_diary_app_jcf10/utils/route_utils.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  FlutterLogoStyle myStyle = FlutterLogoStyle.markOnly;

  void changeScreen() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        myStyle = FlutterLogoStyle.horizontal;
      });
    });

    Timer.periodic(
      const Duration(seconds: 3),
      (tick) {
        Navigator.of(context).pushReplacementNamed(MyRoutes.home);
        tick.cancel();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(
              flex: 3,
            ),
            Image.asset("assets/images/intro.gif"),
            const Spacer(
              flex: 1,
            ),
            FlutterLogo(
              size: 280,
              duration: const Duration(seconds: 3),
              style: myStyle,
            ),
            const Spacer(),
            const Text(
              "Made in flutter with ♥",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const Spacer(),
            CircularProgressIndicator(
              backgroundColor: Colors.red.shade200,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
