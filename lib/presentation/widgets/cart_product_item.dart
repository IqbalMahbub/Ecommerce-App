import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../utility/app_color.dart';
import '../utility/assets_path.dart';

class CartProductItem extends StatefulWidget {
  const CartProductItem({super.key});

  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
    int _counterValue = 1;
  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      elevation: 4,
      surfaceTintColor: Colors.white,
      child: Row(
        children: [
          _buildProductImg(),
          Expanded(
              child: _buildProductDetails())
        ],
      ),
    );
  }

  Widget _buildProductDetails() {
    return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildProductName(),
                              _builtColorAndSize()
                            ])),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete_outline_sharp))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "\$100",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColores.primaryColor),
                    ),
                    _builtitemCount(),
                  ],
                )
              ],
            );
  }

  Wrap _builtColorAndSize() {
    return const Wrap(
                              spacing: 16,
                              children: [
                                Text(
                                  'Color: Red',
                                  style: TextStyle(color: Colors.black54),
                                ),
                                Text('Size: XL',
                                    style: TextStyle(color: Colors.black54))
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

  Widget _buildProductName() {
    return Text(
                              maxLines: 1,
                              'Nike Shoe 212451512',
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            );
  }

  Widget _buildProductImg() {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsPath.productDummyImgPng,
            width: 100,
          ),
        );
  }
}
