import 'package:ecommerceapp/presentation/screens/splash_screen.dart';
import 'package:ecommerceapp/presentation/utility/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CraftyBay  extends StatelessWidget {
  const CraftyBay ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      theme: ThemeData(
        colorSchemeSeed:AppColores.primaryColor,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColores.primaryColor,
        )
      ),
    );
  }
}
