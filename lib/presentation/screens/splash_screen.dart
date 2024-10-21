import 'package:ecommerceapp/presentation/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../widgets/app_logo.dart';
import 'HomeScreen.dart';
import 'email_varificationScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _gotoNextScreen();
  }
 Future<void>  _gotoNextScreen()async {
   await Future.delayed(const Duration(milliseconds: 5));
    Get.to(()=>EmailVarificationScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(
              height: 16,
            ),
            Text("Version  1.0.0"),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

