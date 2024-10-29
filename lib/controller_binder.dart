import 'package:ecommerceapp/presentation/state_holders/home_slider_controller.dart';
import 'package:ecommerceapp/presentation/state_holders/main_bottom_nav_bar_cntroller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
   Get.put(MainBottomNavBarController());
   Get.put(HomeSliderController());
  }

}
