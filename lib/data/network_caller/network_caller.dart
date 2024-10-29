import 'dart:convert';
import 'package:ecommerceapp/presentation/screens/email_varificationScreen.dart';
import 'package:get/get.dart' as getX;
import 'package:http/http.dart';
import 'dart:developer';
import '../models/network_responce.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest({required String url}) async {
    try {
      log(url);
      final Response response = await get(Uri.parse(url));
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        final decodetData = jsonDecode(response.body);
        return NetworkResponse(
            responseCode: response.statusCode,
            isSuccess: true,
            responseData: decodetData);
      } else if (response.statusCode == 401) {
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
        responseCode: -1,
        isSuccess: false,
        errorMassage: e.toString(),
      );
    }
  }

  static Future<NetworkResponse> postRequest(
      {required String url, Map<String, dynamic>? body}) async {

    try {
      log(url);
      final Response response = await post(Uri.parse(url),
          headers: {'accept': 'application/json'}, body: body);
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        final decodetData = jsonDecode(response.body);
        return NetworkResponse(
            responseCode: response.statusCode,
            isSuccess: true,
            responseData: decodetData);
      } else if (response.statusCode == 401) {
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
        responseCode: -1,
        isSuccess: false,
        errorMassage: e.toString(),
      );
    }
  }

  static void _gotoSignInScreen() {
    getX.Get.to(() => const EmailVarificationScreen());
  }
}
