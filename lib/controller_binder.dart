import 'package:ecommerceapp/presentation/state_holders/add_to_cart_controller.dart';
import 'package:ecommerceapp/presentation/state_holders/add_to_wish_list_controller.dart';
import 'package:ecommerceapp/presentation/state_holders/cart_list_controller%20(1).dart';
import 'package:ecommerceapp/presentation/state_holders/category_list_controller.dart';
import 'package:ecommerceapp/presentation/state_holders/compleate_profile_controller.dart';
import 'package:ecommerceapp/presentation/state_holders/home_slider_controller.dart';
import 'package:ecommerceapp/presentation/state_holders/main_bottom_nav_bar_cntroller.dart';
import 'package:ecommerceapp/presentation/state_holders/new_product_list_controller.dart';
import 'package:ecommerceapp/presentation/state_holders/payment_controller.dart';
import 'package:ecommerceapp/presentation/state_holders/popular_product_list_controller.dart';
import 'package:ecommerceapp/presentation/state_holders/product_details_controller.dart';
import 'package:ecommerceapp/presentation/state_holders/product_list_by_category_controller.dart';
import 'package:ecommerceapp/presentation/state_holders/read_profile_controller.dart';
import 'package:ecommerceapp/presentation/state_holders/special_product_list_controller.dart';
import 'package:ecommerceapp/presentation/state_holders/verify_email_controller.dart';
import 'package:ecommerceapp/presentation/state_holders/verify_otp_controller.dart';
import 'package:ecommerceapp/presentation/state_holders/wish_list_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
   Get.put(MainBottomNavBarController());
   Get.put(HomeSliderController());
   Get.put(CategoryListController());
   Get.put(ProductListByCategoryController());
   Get.put(NewProductListController());
   Get.put(PopularProductListController());
   Get.put(SpecialProductListController());
   Get.put(ProductDetailsController());
   Get.put(AddToCartController());
   Get.put(VerifyEmailController());
   Get.put(VerifyOtpController());
   Get.put(AddToWishListController());
   Get.put(ReadProfileController());
   Get.put(WishListController());
   Get.put(CartListController());
   Get.put(CompleteProfileController());
   Get.put(CreateInvoiceController());
  }

}
