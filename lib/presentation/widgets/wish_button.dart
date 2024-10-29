import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utility/app_color.dart';

class WishButton extends StatelessWidget {
  const WishButton({super.key, this.showAddWishList=true});
final showAddWishList ;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showAddWishList,
      replacement:_getIconButton(Icons.delete_outline),
      child:_getIconButton(Icons.favorite_outline),
    );
  }

  Widget _getIconButton(IconData icon){
    return  Card(
      color: AppColores.primaryColor,
      shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(4)
      ),
      child: Padding(
        padding: EdgeInsets.all(2.0),
        child: Icon(icon,
          size: 16,color: Colors.white,),
      ),
    );
  }
}
