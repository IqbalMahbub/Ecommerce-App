import 'package:ecommerceapp/presentation/widgets/app_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'otp_varification_Screen.dart';

class EmailVarificationScreen extends StatefulWidget {
  const EmailVarificationScreen({super.key});

  @override
  State<EmailVarificationScreen> createState() => _EmailVarificationScreenState();
}

class _EmailVarificationScreenState extends State<EmailVarificationScreen> {
  final TextEditingController _emailTEController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    final  textTheme = Theme.of(context).textTheme;
    return Scaffold(
  body: Padding(
    padding: const EdgeInsets.all(24),
    child: Column(
    children: [
      const SizedBox(height: 100,),
      const AppLogo(),
      const SizedBox(height: 16,),
      Text("Welcome Back",style: textTheme.titleLarge,),
      const SizedBox(height: 4,),
      Text("Enter Yur Email Address",style: textTheme.headlineSmall,),
      const SizedBox(height: 16,),
      TextFormField(
        controller: _emailTEController,
        decoration: const InputDecoration(
          hintText: "Email",
        ),
      ),
      const SizedBox(height: 16,),
      SizedBox(
        height: 40,
        child: ElevatedButton(
            onPressed: (){
              Get.to(()=> const OtpVarificationScreen(email: '',));
            }, child: const Text('Next')
        ),
      ),

    ],
    ),
  ),

    );
  }
  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
