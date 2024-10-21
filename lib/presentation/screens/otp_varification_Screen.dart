import 'package:ecommerceapp/presentation/utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/app_logo.dart';
import 'complete_profile_Screen.dart';

class OtpVarificationScreen extends StatefulWidget {
final String email;

  const OtpVarificationScreen({super.key,required this.email});

  @override
  State<OtpVarificationScreen> createState() => _OtpVarificationScreenState();
}

class _OtpVarificationScreenState extends State<OtpVarificationScreen> {
  final TextEditingController _OTPTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 100,),
            const AppLogo(),
            const SizedBox(height: 16,),
            Text("Enter OTP Code", style: textTheme.titleLarge,),
            const SizedBox(height: 4,),
            Text("A 6 digit OTP has been sent to your Email", style: textTheme.headlineSmall,),
            const SizedBox(height: 16,),
            _buildPinField(),
            const SizedBox(height: 16,),
            SizedBox(height: 40,
              child: ElevatedButton(onPressed: () {
                    Get.to(()=>CompleteProfileScreen());
                  }, child: const Text('Next')),
            ),
            const SizedBox(height: 16,),
            _buildRichText(),
            TextButton(onPressed: () {}, child: const Text("Resend code"))
          ],
        ),
      ),
    );
  }

  Widget _buildRichText() {
    return RichText(
        text: const TextSpan(
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            children: [
          TextSpan(text: 'This code will expair in '),
          TextSpan(
              text: '100s', style: TextStyle(color: AppColores.primaryColor)),
        ]));
  }

  Widget _buildPinField() {
    return PinCodeTextField(
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.transparent,
        selectedFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      controller: _OTPTEController,
      appContext: context,
    );
  }

  @override
  void dispose() {
    _OTPTEController.dispose();
    super.dispose();
  }
}
