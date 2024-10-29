import 'package:ecommerceapp/presentation/widgets/wish_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../state_holders/main_bottom_nav_bar_cntroller.dart';
import '../utility/app_color.dart';
import '../widgets/color_picker.dart';
import '../widgets/product_img_carousel_slider.dart';
import '../widgets/size_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _counterValue = 1;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Product Details"),
          leading: IconButton(
              onPressed: () {
                Get.find<MainBottomNavBarController>().backToHome();
              },
              icon: const Icon(Icons.arrow_back_ios_new_sharp)),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductImgCaroselSlider(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                'Nike Shoe 2024 Latest Edition 88AFE45',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black.withOpacity(0.8),
                                ),
                              )),
                              _builtitemCount(),
                            ],
                          ),
                          _buildReviewsAndFavorite(),  SizedBox(
                            height: 16,
                          ),

                          Text(
                            'Color',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          ColorPicker(colors: [
                            Colors.black,
                            Colors.red,
                            Colors.amber,
                            Colors.blue,
                            Colors.purple
                          ], onChange: (Color selectColor) {}),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Size',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          SizePicker(size: [
                            'M','L','XL','XXL'
                          ], onChange: (String s) {  },),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Description',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum(The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum,, comes from a line in section 1.10.32."),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: _buildAddToCartSection(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildReviewsAndFavorite() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      alignment: WrapAlignment.start,
      children: [
        const Wrap(
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            ),
            Text('3.4'),
          ],
        ),
        TextButton(onPressed: () {}, child: const Text('Reviews')),
        const WishButton(
          showAddWishList: true,
        ),
      ],
    );
  }

  Widget _builtitemCount() {
    return ItemCount(
      color: AppColores.primaryColor,
      initialValue: _counterValue,
      minValue: 1,
      maxValue: 20,
      decimalPlaces: 0,
      onChanged: (value) {
        _counterValue = value as int;
        setState(() {});
      },
    );
  }

  Widget _buildAddToCartSection() {
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
          _PriceWidget(),
          SizedBox(
              width: 120,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Add to Cart'),
              ))
        ],
      ),
    );
  }

  Widget _PriceWidget() {
    return const Column(
      children: [
        Text(' Price',style: TextStyle(fontWeight:
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

