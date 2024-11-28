import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../my_app/lib/utilis/app_color.dart';

class ProductImgCaroselSlider extends StatefulWidget {
  const ProductImgCaroselSlider({
    super.key, required this.images,
  });
final List<String> images;
  @override
  State<ProductImgCaroselSlider> createState() =>
      _ProductImgCaroselSliderState();
}

class _ProductImgCaroselSliderState extends State<ProductImgCaroselSlider> {
  final ValueNotifier<int> _selectedPageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            _buildCarouselSlider(),
            Positioned(
                bottom: 8,
                left: 0,
                right: 0,
                child: _buildValueListenableBuilder()),
          ],
        )
      ],
    );
  }

  Widget _buildValueListenableBuilder() {
    return ValueListenableBuilder(
        valueListenable: _selectedPageIndex,
        builder: (context, currentPage, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i <widget.images.length; i++)
                Container(
                  height: 12,
                  width: 12,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                      color: i == currentPage
                          ? AppColores.primaryColor
                          : Colors.white,
                      border: Border.all(
                          color: i == currentPage
                              ? AppColores.primaryColor
                              : Colors.white,
                          width: 1),
                      borderRadius: BorderRadius.circular(50)),
                )
            ],
          );
        });
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
          height: 220,
          viewportFraction: 1,
          onPageChanged: (index, _) {
            _selectedPageIndex.value = index;
          }),
      items:widget.images.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.shade300,
                alignment: Alignment.center,
                child:Image.network(image,fit:BoxFit.cover)
            );
          },
        );
      }).toList(),
    );
  }
}
