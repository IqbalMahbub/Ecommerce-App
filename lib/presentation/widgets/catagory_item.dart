import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../screens/product_list_screen.dart';
import '../utility/app_color.dart';

class CatagoryItem extends StatelessWidget {
  const CatagoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>ProductListScreen(categoryName:'Electronics'));
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColores.primaryColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(CupertinoIcons.desktopcomputer,size: 40,
              color: AppColores.primaryColor,),
          ),
          SizedBox(height: 8,),
          Text('Electronics',style: TextStyle(fontSize: 16,color:
          AppColores.primaryColor,fontWeight: FontWeight.w500,
              letterSpacing:0.4 ),)
        ],
      ),
    );
  }
}