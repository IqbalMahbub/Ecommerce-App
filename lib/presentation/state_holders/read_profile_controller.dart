import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../data/models/network_responce.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/utility/urls.dart';
import '../screens/complete_profile_Screen.dart';
import '../screens/main_bottom_nav_bar_screen.dart';

class ReadProfileController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  var profileData;
  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<void> readProfile() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.readProfile(),
    );
    if (response.isSuccess) {
      profileData=response.responseData['data'];
      print(profileData);

     if(profileData==null){
       Get.to(() => const CompleteProfileScreen());
       print("goto complete screen");
     } else {
       print("goto home screen");
       Get.offAll(() => const MainBottomNavBarScreen());
     }
    } else {
      _errorMessage = response.errorMassage!;
    }
    _inProgress = false;
    update();

  }
}
