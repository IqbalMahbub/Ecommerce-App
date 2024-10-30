import 'package:ecommerceapp/presentation/state_holders/category_list_controller.dart';
import 'package:ecommerceapp/presentation/state_holders/home_slider_controller.dart';
import 'package:ecommerceapp/presentation/state_holders/main_bottom_nav_bar_cntroller.dart';
import 'package:ecommerceapp/presentation/state_holders/popular_product_list_controller.dart';
import 'package:ecommerceapp/presentation/utility/assets_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../data/models/category.dart';
import '../../data/models/product.dart';
import '../state_holders/new_product_list_controller.dart';
import '../state_holders/special_product_list_controller.dart';
import '../widgets/app_bar_icon.dart';
import '../widgets/catagory_item.dart';
import '../widgets/centered_circular_progress.dart';
import '../widgets/home_carousel_slider.dart';
import '../widgets/product_cart.dart';
import '../widgets/section_header.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final TextEditingController _searchTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildSearchTextField(),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<HomeSliderController>(builder: (sliderController) {
                if (sliderController.inProgress) {
                  return SizedBox(
                      height: 200, child: CenterdCircularProgressIndicator());
                }
                return HomeCaroselSlider(
                  sliderList: sliderController.siderList,
                );
              }),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(
                title: 'All Catagory',
                onTapSeeAll: () {
                  Get.find<MainBottomNavBarController>().selectCategory();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<CategoryListController>(
                  builder: (categoryListController) {
                if (categoryListController.inProgress) {
                  return const SizedBox(
                      height: 120, child: CenterdCircularProgressIndicator());
                }
                return _buildCatagoryListView(
                    categoryListController.categoryList);
              }),
              const SizedBox(
                height: 8,
              ),
              SectionHeader(title: 'Popular', onTapSeeAll: () {}),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<PopularProductListController>(
                  builder: (popularProductListController) {
                if (popularProductListController.popularProductInProgress) {
                  return const SizedBox(
                      height: 210, child: CenterdCircularProgressIndicator());
                }
                return _buildroductListView(
                    popularProductListController.productList);
              }),
              const SizedBox(
                height: 8,
              ),
              SectionHeader(title: 'Special', onTapSeeAll: () {}),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<SpecialProductListController>(
                  builder: (specialProductListController) {
                if (specialProductListController.inProgress) {
                  return const SizedBox(
                      height: 210, child: CenterdCircularProgressIndicator());
                }
                return _buildroductListView(
                    specialProductListController.productList);
              }),
              const SizedBox(
                height: 8,
              ),
              SectionHeader(title: 'New', onTapSeeAll: () {}),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<NewProductListController>(
                  builder: (newProductListController) {
                if (newProductListController.inProgress) {
                  return const SizedBox(
                      height: 210, child: CenterdCircularProgressIndicator());
                }
                return _buildroductListView(
                    newProductListController.productList);
              }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchTEController.dispose();
    super.dispose();
  }

  Widget _buildCatagoryListView(List<Category> categoryList) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categoryList
            .map((e) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CatagoryItem(catagory: e),
                    SizedBox(
                      width: 16,
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }

  Widget _buildroductListView(List<Product> productList) {
    return SizedBox(
        child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: productList
            .map((e) => PoductCard(
                  product: e,
                ))
            .toList(),
      ),
    ));
  }

  Widget _buildSearchTextField() {
    return TextField(
      controller: _searchTEController,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: "Search",
          filled: true,
          fillColor: Colors.grey.shade200,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none)),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.HomeappLogoSvg),
      actions: [
        AppbarIcon(
          icon: Icons.person,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        AppbarIcon(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        AppbarIcon(
          icon: Icons.notifications,
          onTap: () {},
        ),
      ],
    );
  }
}
// TOdo Refactor class
