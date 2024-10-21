import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/presentation/utility/app_color.dart';
import 'package:ecommerceapp/presentation/utility/assets_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/app_bar_icon.dart';

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
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              _buildSearchTextField(),
              SizedBox(height: 16,),
              HomeCaroselSlider(),

            ],
            
          ),
        ),
      ) ,
    );

  }

  Widget _buildSearchTextField() {
    return TextField(
              controller:_searchTEController ,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                filled: true,
                fillColor: Colors.grey.shade200,
                enabledBorder: OutlineInputBorder(borderSide: BorderSide
                    .none,borderRadius: BorderRadius.circular(8)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none)
              ),
            );
  }
@override
  void dispose() {
   _searchTEController.dispose();
    super.dispose();
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

class HomeCaroselSlider extends StatefulWidget {
  const HomeCaroselSlider({
    super.key,
  });

  @override
  State<HomeCaroselSlider> createState() => _HomeCaroselSliderState();
}

class _HomeCaroselSliderState extends State<HomeCaroselSlider> {
  final ValueNotifier<int> _selectedPageIndex =ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCarouselSlider(),
        _buildValueListenableBuilder()

      ],
    );
  }

  ValueListenableBuilder<int> _buildValueListenableBuilder() {
    return ValueListenableBuilder(
        valueListenable: _selectedPageIndex,
        builder: (context,currentPage,_){
        return  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(int i=0;i<5;i++)
              Container(
                height: 15,
                width: 15,
                margin: EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: i==currentPage?AppColores.primaryColor:null,
                    border:Border.all(color: i==currentPage?AppColores
                        .primaryColor:Colors.grey,
                    width: 1),borderRadius: BorderRadius.circular(50) ),
              )
          ],
        );
  }
      );
  }

  CarouselSlider _buildCarouselSlider() {
    return CarouselSlider(
        options: CarouselOptions(height: 180.0,viewportFraction: 1,
    onPageChanged:(index, _){
      _selectedPageIndex.value=index;
    } ),
        items: [1,2,3,4,5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColores.primaryColor,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  alignment: Alignment.center,
                  child: Text('text $i', style: TextStyle(fontSize: 16.0),)
              );
            },
          );
        }).toList(),
      );
  }
}
