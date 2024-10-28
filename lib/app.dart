import 'package:ecommerceapp/controller_binder.dart';
import 'package:ecommerceapp/presentation/screens/splash_screen.dart';
import 'package:ecommerceapp/presentation/utility/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class CraftyBay  extends StatefulWidget {
  const CraftyBay ({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
      initialBinding:ControllerBinder() ,
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColores.primaryColor,
          )
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style:ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(double.maxFinite),
            padding: EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            backgroundColor:AppColores.primaryColor,
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),
          ),
        ),

        inputDecorationTheme:_inputDecorationTheme(),

        textTheme:_textTheme(),

        colorSchemeSeed:AppColores.primaryColor,

        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColores.primaryColor,
        )
      ),
    );
  }

  InputDecorationTheme _inputDecorationTheme() =>  InputDecorationTheme(
    hintStyle: TextStyle(color: CupertinoColors.inactiveGray,fontWeight:FontWeight.w400 ),
      border:_outlineInputBorder ,
      enabledBorder:_outlineInputBorder ,
     focusedBorder:  _outlineInputBorder,
      errorBorder:_outlineInputBorder.copyWith(borderSide: BorderSide(color:
      Colors.red)) ,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8)
  );
  final OutlineInputBorder _outlineInputBorder =const OutlineInputBorder(
      borderSide: BorderSide(color: AppColores.primaryColor)
  );
  TextTheme _textTheme ()=> TextTheme(
      titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.black
      ),
      headlineSmall: TextStyle(
          fontSize: 16,
          color: Colors.blueGrey
      )
  );

}
