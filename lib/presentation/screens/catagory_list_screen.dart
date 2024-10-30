import 'package:ecommerceapp/presentation/widgets/catagory_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../state_holders/category_list_controller.dart';
import '../state_holders/main_bottom_nav_bar_cntroller.dart';

class CatagoryListScreen extends StatefulWidget {
  const CatagoryListScreen({super.key});

  @override
  State<CatagoryListScreen> createState() => _CatagoryListScreenState();
}

class _CatagoryListScreenState extends State<CatagoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Catagory List'),
            leading: IconButton(
                onPressed: () {
                  Get.find<MainBottomNavBarController>().backToHome();
                },
                icon: Icon(Icons.arrow_back_ios_new_sharp))),
        body: GetBuilder<CategoryListController>(
            builder: (categoryListController) {
          if (categoryListController.inProgress) {
            return const Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
            onRefresh: categoryListController.getCategoryList,
            child: GridView.builder(
                itemCount: categoryListController.categoryList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, childAspectRatio: 0.75),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CatagoryItem(
                      catagory: categoryListController.categoryList[index],
                    ),
                  );
                }),
          );
        }),
      ),
    );
  }
}
