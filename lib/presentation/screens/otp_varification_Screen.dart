import 'package:ecommerceapp/presentation/screens/HomeScreen.dart';
import 'package:ecommerceapp/presentation/state_holders/verify_otp_controller.dart';
import '../../../../my_app/lib/utilis/app_color.dart';
import 'package:ecommerceapp/presentation/widgets/snack_massege.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../state_holders/read_profile_controller.dart';
import '../widgets/app_logo.dart';
import '../widgets/centered_circular_progress.dart';
import 'complete_profile_Screen.dart';
import 'main_bottom_nav_bar_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;

  const OtpVerificationScreen({super.key, required this.email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 100),
                const AppLogo(),
                const SizedBox(height: 16),
                Text('Enter OTP Code', style: textTheme.headlineLarge),
                const SizedBox(height: 4),
                Text('A 4 digit OTP code has been sent',
                    style: textTheme.headlineSmall),
                const SizedBox(height: 24),
                _buildPinField(),
                const SizedBox(height: 16),
                GetBuilder<VerifyOtpController>(builder: (verifyOtpController) {
                  if (verifyOtpController.inProgress) {
                    return const CenterdCircularProgressIndicator();
                  }

                  return ElevatedButton(
                    onPressed: () async {
                      final result = await verifyOtpController.verifyOtp(
                          widget.email, _otpTEController.text);
                        print(result);
                      if (result) {
                        // TODO: Pending in next 30th May, 2024
                        // 1. If success, then call another api named "readProfile"
                        //   a. Create Read profile controller
                        // 2. check if data is "null" or not, if null then move to the
                        //    Complete profile screen, then move to home page
                        //    a. Create complete profile controller
                        // 3. Otherwise back to the home page
                        final readProfileController = ReadProfileController();
                          await readProfileController.readProfile();
                      } else {
                        if (mounted) {
                          showSnackMassage(context, verifyOtpController.errorMessage);
                        }
                      }
                    },
                    child: const Text('Next'),
                  );
                }),
                const SizedBox(height: 24),
                _buildResendCodeMessage(),
                TextButton(
                  onPressed: () {},
                  child: const Text('Resend Code'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResendCodeMessage() {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(text: 'This code will expire in '),
          // TODO: complete this count down
          TextSpan(
              text: '100s', style: TextStyle(color: AppColores.primaryColor)),
        ],
      ),
    );
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
      controller: _otpTEController,
      appContext: context,
    );
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }
}
