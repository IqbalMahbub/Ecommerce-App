

import 'package:ecommerceapp/presentation/state_holders/user_auth_controller.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/models/network_responce.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/utility/urls.dart';

class VerifyOtpController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> verifyOtp(String email, String otp) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.verifyOtp(email, otp),
      fromAuth: true,
    );
    if (response.isSuccess) {
      await UserAuthController.saveUserToken(response.responseData['data']);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMassage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
