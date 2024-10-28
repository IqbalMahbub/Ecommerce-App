
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utility/app_color.dart';

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

 Widget _buildValueListenableBuilder() {
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

  Widget _buildCarouselSlider() {
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