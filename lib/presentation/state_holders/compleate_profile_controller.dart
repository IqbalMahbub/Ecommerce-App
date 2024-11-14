

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/models/cart_model.dart';
import '../../data/models/completeProfile_model.dart';
import '../../data/models/network_responce.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/utility/urls.dart';

class CompleteProfileController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> completeProfile(CompleteProfileModel completeProfileModel)
  async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.createPtofile,
      body: completeProfileModel.toJson(),
    );
    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMassage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}