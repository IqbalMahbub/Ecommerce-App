import 'package:ecommerceapp/presentation/widgets/app_logo.dart';
import 'package:ecommerceapp/presentation/widgets/centered_circular_progress.dart';
import 'package:ecommerceapp/presentation/widgets/snack_massege.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state_holders/verify_email_controller.dart';
import '../utility/constants.dart';
import 'otp_varification_Screen.dart';

class EmailVarificationScreen extends StatefulWidget {
  const EmailVarificationScreen({super.key});

  @override
  State<EmailVarificationScreen> createState() => _EmailVarificationScreenState();
}

class _EmailVarificationScreenState extends State<EmailVarificationScreen> {
  final TextEditingController _emailTEController =TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final  textTheme = Theme.of(context).textTheme;
    return Scaffold(
  body: SafeArea(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
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
              autovalidateMode:AutovalidateMode.onUserInteraction ,
              controller: _emailTEController,
              decoration: const InputDecoration(
                hintText: "Email",
              ),
              validator:(String? value){
                  if(value?.isEmpty ?? true){
                    return "Enter your Email";
                  }
                  if(Constants.emailValidatorRegExp.hasMatch(value!)==false){
                    return "Enter a valid Email address";
                  }
                  return null;
            }
            ),
            const SizedBox(height: 16,),
            SizedBox(
              height: 40,
              child: GetBuilder<VerifyEmailController>(
                builder: (verifyEmailController) {
                  if(verifyEmailController.inProgress){
                    return const CenterdCircularProgressIndicator();
                  }
                  return ElevatedButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          verifyEmailController.verifyEmail
                            (_emailTEController.text.trim()).then((result) =>
                         Get.to(()=>OtpVerificationScreen(email: _emailTEController.text)));
                        }else{
                          showSnackMassage(context, verifyEmailController
                              .errorMessage);
                        }

                      }, child: const Text('Next')
                  );
                }
              ),
            ),
                
          ],
          ),
        ),
      ),
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
