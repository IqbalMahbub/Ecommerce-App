import 'package:ecommerceapp/data/models/completeProfile_model.dart';
import 'package:ecommerceapp/presentation/screens/HomeScreen.dart';
import 'package:ecommerceapp/presentation/state_holders/compleate_profile_controller.dart';
import 'package:ecommerceapp/presentation/utility/app_color.dart';
import 'package:ecommerceapp/presentation/widgets/centered_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/app_logo.dart';
import '../widgets/snack_massege.dart';
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
  final TextEditingController _userIdTEController = TextEditingController();
  final GlobalKey<FormState>_formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;
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
    GetBuilder<CompleteProfileController>(
    builder: (completeProfileController) {
    if(completeProfileController.inProgress){
    return const CenterdCircularProgressIndicator();
    }
    return ElevatedButton(onPressed: () async {
    CompleteProfileModel completeProfileModel =
    CompleteProfileModel(
    cusName: _firstNameTEController.text,
    cusAdd: _shippingAddressTEController.text,
    cusCity: _cityTEController.text,
    cusPhone: _mobileTEController.text,
    created_at: DateTime.now().toString(),
    updated_at:DateTime.now().toString(),
    user_id: 0);
    bool isSuccess=await completeProfileController.completeProfile(completeProfileModel);
    if(isSuccess){
    if(mounted){
    showSnackMassage(context, "Profile "
    "Complete");
    Get.offAll(()=>const homeScreen());
    }}else{
    showSnackMassage(context,
    completeProfileController
        .errorMessage);
    }
    }, child: const Text('Complete'),
    );
  }

  ),
  ),
  ],

  ),
  ),
  ),

  )

  ,

  );
}

Widget _buildCompleteProfileForm() {
  return Form(
    key: _formKey,
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
        TextFormField(
          controller: _userIdTEController,
          maxLines: 1,
          decoration: const InputDecoration(
            hintText: "User Id",
          ),
        )
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
}}
