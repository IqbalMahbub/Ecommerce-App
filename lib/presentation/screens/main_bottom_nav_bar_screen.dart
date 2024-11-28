import 'package:ecommerceapp/presentation/state_holders/main_bottom_nav_bar_cntroller.dart';
import '../../../../my_app/lib/utilis/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state_holders/category_list_controller.dart';
import '../state_holders/home_slider_controller.dart';
import '../state_holders/new_product_list_controller.dart';
import '../state_holders/popular_product_list_controller.dart';
import '../state_holders/special_product_list_controller.dart';
import '../widgets/wish_list_screen.dart';
import 'HomeScreen.dart';
import 'cart_screen.dart';
import 'catagory_list_screen.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
final MainBottomNavBarController _navBarController=Get
    .find<MainBottomNavBarController>();
final List<Widget> _screen =const[
  homeScreen(),
  CatagoryListScreen(),
  CartListScreen(),
  WishListScreen(),
];

@override
void initState() {
  super.initState();
  Get.find<HomeSliderController>().getSliders();
  Get.find<CategoryListController>().getCategoryList();
  Get.find<PopularProductListController>().getPopularProductList();
  Get.find<NewProductListController>().getNewProductList();
  Get.find<SpecialProductListController>().getSpecialProductList();

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavBarController>(
        builder: (_) {
          return _screen[_navBarController.selectedIndex];
        },

      ),
      bottomNavigationBar: GetBuilder<MainBottomNavBarController>(
        builder: (_) { return BottomNavigationBar(
          currentIndex:_navBarController.selectedIndex ,
          onTap: _navBarController.changeIndex,
          selectedItemColor:AppColores.primaryColor ,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: 'Categor'
                'y'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Car'
                't'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_outline),label: ''
                'WishList'),
          ],
        ); }

      ),
    );
  }
}
