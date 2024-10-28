import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../state_holders/main_bottom_nav_bar_cntroller.dart';
import '../widgets/product_cart.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key,});



  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_){
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Wish List"),
          leading: IconButton(
            onPressed: (){
              Get.find<MainBottomNavBarController>().backToHome();
            },
            icon: Icon(Icons.arrow_back_ios_new_sharp)),),
        body: GridView.builder(
            itemCount: 15,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
              (crossAxisCount: 3,childAspectRatio: 0.8),
            itemBuilder: (context,indexconst ){
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                child: FittedBox(child:PoductCard(showAddWishList: false,)),
              );
            }
        ),
      ),
    );
  }
}
