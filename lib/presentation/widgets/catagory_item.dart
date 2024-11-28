import 'package:ecommerceapp/presentation/widgets/network_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../data/models/category.dart';
import '../screens/product_list_screen.dart';
import '../../../../my_app/lib/utilis/app_color.dart';

class CatagoryItem extends StatelessWidget {
  const CatagoryItem({
    super.key,
    required this.catagory,
  });

  final Category catagory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductListScreen(
              categoryName: catagory.categoryName ?? "",
              categoryId: catagory.id!,
            ));
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColores.primaryColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: NetworkImageWidget(
              url: catagory.categoryImg ?? "",
              height: 30,
              widget: 30,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            catagory.categoryName ?? " ",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 16,
                color: AppColores.primaryColor,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.4),
          )
        ],
      ),
    );
  }
}
