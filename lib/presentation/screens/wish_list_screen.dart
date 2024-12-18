
import 'package:ecommerceapp/presentation/widgets/centered_circular_progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../state_holders/main_bottom_nav_bar_cntroller.dart';
import '../state_holders/wish_list_controller.dart';
import '../widgets/product_cart.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<WishListController>().getWishList();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wishlist'),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavBarController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios_sharp),
          ),
        ),
        body: GetBuilder<WishListController>(builder: (wishListController) {
          if (wishListController.inProgress) {
            return const CenterdCircularProgressIndicator();
          }

          return RefreshIndicator(
            onRefresh: () async {
              wishListController.getWishList();
            },
            child: GridView.builder(
              itemCount: wishListController.wishList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: FittedBox(
                    child: PoductCard(
                      showAddToWishlist: false,
                      product: wishListController.wishList[index].product!,
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}

