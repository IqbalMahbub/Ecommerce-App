import 'package:ecommerceapp/presentation/utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/app_logo.dart';
import 'complete_profile_Screen.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController = TextEditingController();
final GlobalKey<FormState>_formKey=GlobalKey<FormState>();
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
                  const SizedBox(height: 24,),
                  const AppLogo(),
                  const SizedBox(height: 16,),
                  Text("Complete Profile", style: textTheme.titleLarge,),
                  const SizedBox(height: 4,),
                  Text("Get Started With Us by Providing with your details", style: textTheme.headlineSmall,),
                  _buildCompleteProfileForm(),
                  const SizedBox(height:24 ,),
                  SizedBox(height: 40, child:
                    ElevatedButton(onPressed: () {
                      Get.to(()=>CompleteProfileScreen());
                    }, child: const Text('Complete')),
                  ),
                ],

            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompleteProfileForm() {
    return Form(
      key:_formKey ,
              child: Column(
                    children: [
                      TextFormField(
                        controller: _firstNameTEController,
                        decoration: const InputDecoration(
                          hintText: "First Name",
                        ),
                      ),
                      const SizedBox(height: 8,),
                      TextFormField(
                        controller: _lastNameTEController,
                        decoration: const InputDecoration(
                          hintText: "Last Name",
                        ),
                      ),
                      const SizedBox(height: 8,),
                      TextFormField(
                        controller: _mobileTEController,
                        decoration: const InputDecoration(
                          hintText: "Mobile",
                        ),
                      ),
                      const SizedBox(height: 8,),
                      TextFormField(
                        controller: _cityTEController,
                        decoration: const InputDecoration(
                          hintText: "City",
                        ),
                      ),
                      const SizedBox(height: 8,),
                      TextFormField(
                        controller: _shippingAddressTEController,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          hintText: "Shipping address",
                        ),
                      ),
                    ],
                  ),
    );
  }
  @override
  void dispose() {
   _shippingAddressTEController.dispose();
   _firstNameTEController.dispose();
   _cityTEController.dispose();
   _lastNameTEController.dispose();
   _mobileTEController.dispose();



   super.dispose();
  }
}
