import 'package:ecommerceapp/presentation/widgets/wish_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../data/models/product.dart';
import '../screens/product_details_screen.dart';
import '../../../../my_app/lib/utilis/app_color.dart';
import '../utility/assets_path.dart';

class PoductCard extends StatelessWidget {
  const PoductCard(
      {super.key, this.showAddToWishlist = true, required this.product,});

  final bool showAddToWishlist;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailsScreen(productId: product.id!));
      },
      child: Card(
        elevation: 3,
        surfaceTintColor: Colors.white,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: SizedBox(
          width: 150,
          child: Column(
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                    color: AppColores.primaryColor.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                      product.image ?? ''
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title ?? '',
                      maxLines: 2,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 13,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    Wrap(
                      spacing: 5,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          '\$${product.price}',
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColores.primaryColor),
                        ),
                        Wrap(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            Text('${product.star}')
                          ],
                        ),
                        // WishButton(showAddToWishlist: showAddToWishlist),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
