import 'package:counter_button/counter_button.dart';
import 'package:ecommerceapp/presentation/state_holders/main_bottom_nav_bar_cntroller.dart';
import 'package:ecommerceapp/presentation/utility/app_color.dart';
import 'package:ecommerceapp/presentation/utility/assets_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../widgets/cart_product_item.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Carts'),
          leading: IconButton(
              onPressed: () {
                Get.find<MainBottomNavBarController>().backToHome();
              },
              icon: const Icon(Icons.arrow_back_ios_new_sharp)),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (contex, index) {
                    return const CartProductItem();
                  }),
            ),
            _buildCheckutWidget()
          ],
        ),
      ),
    );
  }

  Widget _buildCheckutWidget() {
    return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColores.primaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(topRight:Radius.circular(16) ,
                  topLeft:Radius.circular(16) )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _totalPriceWidget(),
                SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ))
              ],
            ),
          );
  }

  Widget _totalPriceWidget() {
    return const Column(
                children: [
                  Text('Total Price',style: TextStyle(fontWeight:
                  FontWeight.bold,fontSize: 24,color: Colors.grey),),
                  Text('\$12000',style: TextStyle(
                    fontSize: 24,
                    color: AppColores.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),)
                ],
              );
  }
}
