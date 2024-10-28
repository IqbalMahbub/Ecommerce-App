import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/presentation/utility/app_color.dart';
import 'package:ecommerceapp/presentation/utility/assets_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/app_bar_icon.dart';
import '../widgets/catagory_item.dart';
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
              const SizedBox(height: 16,),
              const HomeCaroselSlider(),
              const SizedBox(height: 16,),
              SectionHeader(title: 'All Catagory',
                onTapSeeAll: () {  }
                ,),
              const SizedBox(height: 10,),
              _buildCatagoryListView(),
              const SizedBox(height: 8,),
              SectionHeader(title: 'Popular Products', onTapSeeAll: (){}),
              const SizedBox(height: 10,),
              PoductCard(),


            ],
            
          ),
        ),
      ) ,
    );

  }

  Widget _buildCatagoryListView() {
    return SizedBox(
              height: 120,
              child: ListView.separated(

                scrollDirection: Axis.horizontal,
                 itemCount: 8,
                  itemBuilder: (contex,index){
                   return const CatagoryItem();
                  }, separatorBuilder: (BuildContext context, int index){
                  return const SizedBox(width: 16,);
              },
              ),
            );
  }
  @override
  void dispose() {
    _searchTEController.dispose();
    super.dispose();
  }


  Widget _buildSearchTextField() {
    return TextField(
              controller:_searchTEController ,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search",
                filled: true,
                fillColor: Colors.grey.shade200,
                enabledBorder: OutlineInputBorder(borderSide: BorderSide
                    .none,borderRadius: BorderRadius.circular(8)),
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none)
              ),
            );
  }



  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.HomeappLogoSvg),
      actions: [
        AppbarIcon(icon:Icons.person, onTap: (){},),
        const SizedBox(width: 8,),
        AppbarIcon(icon:Icons.call, onTap: (){},),
        const SizedBox(width: 8,),
        AppbarIcon(icon:Icons.notifications, onTap: (){},),

      ],
    );
  }


}
// TOdo Refactor class











