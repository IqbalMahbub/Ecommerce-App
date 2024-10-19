import 'package:ecommerceapp/presentation/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            SvgPicture.asset(
             AssetsPath.appLogoSvg,
              width: 100,
            ),
            const Spacer(),
            const CircularProgressIndicator(),
            const SizedBox(
              height: 16,
            ),
            const Text("Version  1.0.0"),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
