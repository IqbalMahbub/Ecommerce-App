
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/presentation/widgets/network_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/slider_data.dart';
import '../utility/app_color.dart';
class HomeCaroselSlider extends StatefulWidget {
  const HomeCaroselSlider({
    super.key,
    required this.sliderList,
  });

  final List<SliderData> sliderList;

  @override
  State<HomeCaroselSlider> createState() => _HomeCaroselSliderState();
}

class _HomeCaroselSliderState extends State<HomeCaroselSlider> {
  final ValueNotifier<int> _selectedPageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCarouselSlider(),
        const SizedBox(height: 8),
        _buildDotIndicator()
      ],
    );
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
          height: 180,
          viewportFraction: 1,
          onPageChanged: (index, _) {
            _selectedPageIndex.value = index;
          }),
      items: widget.sliderList.map((slider) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  color: AppColores.primaryColor,
                  borderRadius: BorderRadius.circular(8)),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: NetworkImageWidget(
                        url: slider.image ?? '',
                        height: double.maxFinite,
                        widget: double.maxFinite,
                        boxFit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: _buildProductDescription(slider),
                  )
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildProductDescription(SliderData slider) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            slider.title ?? '',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            slider.shortDes ?? '',
            maxLines: 3,
            style: const TextStyle(
                color: Colors.black, overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColores.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 6),
                textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {},
              child: const Text('Buy now'),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDotIndicator() {
    return ValueListenableBuilder(
      valueListenable: _selectedPageIndex,
      builder: (context, currentPage, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < widget.sliderList.length; i++)
              Container(
                width: 15,
                height: 15,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: i == currentPage ? AppColores.primaryColor : null,
                  border: Border.all(
                      color: i == currentPage
                          ? AppColores.primaryColor
                          : Colors.grey,
                      width: 1),
                  borderRadius: BorderRadius.circular(50),
                ),
              )
          ],
        );
      },
    );
  }
}