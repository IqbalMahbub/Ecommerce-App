import 'dart:convert';
import 'package:ecommerceapp/presentation/screens/email_varificationScreen.dart';
import 'package:ecommerceapp/presentation/state_holders/user_auth_controller.dart';
import 'package:get/get.dart' as getx;
import 'package:http/http.dart';
import 'dart:developer';
import '../models/network_responce.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest(
      {required String url, bool fromAuth = false}) async {
    try {
      log(url);
      log(UserAuthController.accessToken);
      final Response response = await get(
        Uri.parse(url),
        headers: {
          'accept': 'application/json',
          'token': UserAuthController.accessToken
        },
      );
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
            responseCode: response.statusCode,
            isSuccess: true,
            responseData: decodedData);
      } else if (response.statusCode == 401) {
        if (!fromAuth) {
          _goToSignInScreen();
        }
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      } else {
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      log(e.toString());
      return NetworkResponse(
          responseCode: -1, isSuccess: false, errorMassage: e.toString());
    }
  }

  static Future<NetworkResponse> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      log(url);
      log(UserAuthController.accessToken);
      log(body.toString());
      final Response response = await post(Uri.parse(url),
          headers: {
            'accept': 'application/json',
            'token': UserAuthController.accessToken
          },
          body: body);
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
            responseCode: response.statusCode,
            isSuccess: true,
            responseData: decodedData);
      } else if (response.statusCode == 401) {
        _goToSignInScreen();
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      } else {
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      log(e.toString());
      return NetworkResponse(
          responseCode: -1, isSuccess: false, errorMassage: e.toString());
    }
  }

  static Future<void> _goToSignInScreen() async {
    // Navigator.push(
    //   CraftyBay.navigationKey.currentState!.context,
    //   MaterialPageRoute(
    //     builder: (context) => const EmailVerificationScreen(),
    //   ),
    // );

    await UserAuthController.clearUserData();
    getx.Get.to(() => const EmailVarificationScreen());
  }
}
