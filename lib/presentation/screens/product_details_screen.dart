import 'package:ecommerceapp/data/models/cart_model.dart';
import 'package:ecommerceapp/data/models/product_details_model.dart';
import 'package:ecommerceapp/presentation/state_holders/add_to_cart_controller.dart';
import 'package:ecommerceapp/presentation/state_holders/add_to_wish_list_controller.dart';
import 'package:ecommerceapp/presentation/state_holders/product_details_controller.dart';
import 'package:ecommerceapp/presentation/widgets/centered_circular_progress.dart';
import 'package:ecommerceapp/presentation/widgets/snack_massege.dart';
import 'package:ecommerceapp/presentation/widgets/wish_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../state_holders/main_bottom_nav_bar_cntroller.dart';
import '../../../../my_app/lib/utilis/app_color.dart';
import '../widgets/product_img_carousel_slider.dart';
import '../widgets/size_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _counterValue = 1;
  String? _selectedColor;
  String? _selectedSize;

  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailController) {
            if (productDetailController.inProgress) {
              return const CenterdCircularProgressIndicator();
            }

            if (productDetailController.errorMessage.isNotEmpty) {
              return Center(
                child: Text(productDetailController.errorMessage),
              );
            }

            ProductDetailsModel productDetails =
                productDetailController.productDetailsModel;
            List<String> colors = productDetails.color?.split(',') ?? [];
            List<String> sizes = productDetails.size?.split(',') ?? [];
            _selectedSize = sizes.first;
            _selectedColor = colors.first;

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProductImgCaroselSlider(
                          images: [
                            productDetails.img1 ?? '',
                            productDetails.img2 ?? '',
                            productDetails.img3 ?? '',
                            productDetails.img4 ?? '',
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                        productDetails.product?.title ?? '',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black.withOpacity(0.8)),
                                      )),
                                  _buildCounter()
                                ],
                              ),
                              _buildReviewSection(productDetails),
                              const Text(
                                'Color',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              const SizedBox(height: 16),
                              SizePicker(
                                size: colors,
                                onChange: (String s) {
                                  _selectedColor = s;
                                },
                                isRounded: false,
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'Size',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              const SizedBox(height: 16),
                              SizePicker(
                                size: sizes,
                                onChange: (String s) {
                                  _selectedSize = s;
                                },
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'Description',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                productDetails.product?.shortDes ?? '',
                              ),
                              const SizedBox(height: 8),
                              Text(
                                productDetails.des ?? '',
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                _buildAddToCartSection(productDetails)
              ],
            );
          }),
    );
  }

  Widget _buildAddToCartSection(ProductDetailsModel productDetails) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color:AppColores.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPriceWidget(productDetails),
          SizedBox(
            width: 120,
            child: GetBuilder<AddToCartController>(
              builder: (addToCartController) {
                if (addToCartController.inProgress) {
                  return const CenterdCircularProgressIndicator();
                }

                return ElevatedButton(
                  onPressed: () {
                    CartModel cartModel = CartModel(
                      productId: widget.productId,
                      color: _selectedColor ?? '',
                      size: _selectedSize ?? '',
                      quantity: _counterValue,
                    );

                    addToCartController.addToCart(cartModel).then((result) {
                      if (result) {
                        showSnackMassage(context, 'Added to cart');
                      } else {
                        showSnackMassage(
                            context, addToCartController.errorMessage);
                      }
                    });
                  },
                  child: const Text('Add to Cart'),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPriceWidget(ProductDetailsModel productDetails) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Price',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        Text(
          '\$${productDetails.product?.price ?? 0}',
          style: const TextStyle(
              fontSize: 24,
              color: AppColores.primaryColor,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildReviewSection(ProductDetailsModel productDetails) {
    return Wrap(
      spacing: 5,
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Wrap(
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            ),
            Text('${productDetails.product?.star ?? 0}')
          ],
        ),
        TextButton(onPressed: () {}, child: const Text('Reviews')),
        GetBuilder<AddToWishListController>(
          builder: (addToWishListController) {
            if (addToWishListController.inProgress) {
              return Transform.scale(
                  scale: 0.4, child: const CircularProgressIndicator());
            }

            return WishButton(
              showAddToWishlist: true,
              isSelected: true,
              onTap: () {
                addToWishListController.addToWishList(widget.productId);
              },
            );
          },
        )
      ],
    );
  }

  Widget _buildCounter() {
    return ItemCount(
      initialValue: _counterValue,
      minValue: 1,
      maxValue: 20,
      decimalPlaces: 0,
      color: AppColores.primaryColor,
      onChanged: (value) {
        _counterValue = value as int;
        setState(() {});
      },
    );
  }
}